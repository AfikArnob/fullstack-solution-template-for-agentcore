#!/bin/bash

STACK_NAME=${1:-$(grep 'stack_name_base:' infra-cdk/config.yaml | awk '{print $2}' | tr -d '"')}
USERNAME=${2:-admin}
ADMIN_EMAIL=${3:-""}

echo "Using stack: ${STACK_NAME}"

# Get User Pool ID from SSM
set +e
USER_POOL_ID=$(aws ssm get-parameter \
  --name "/${STACK_NAME}/cognito-user-pool-id" \
  --query 'Parameter.Value' \
  --output text 2>&1)
EXIT_CODE=$?
set -e

if [ $EXIT_CODE -ne 0 ]; then
  echo "Error: Failed to get User Pool ID"
  echo "$USER_POOL_ID"
  exit 1
fi

[ -z "$USER_POOL_ID" ] && { echo "Error: User Pool ID not found"; exit 1; }

echo "Found User Pool: $USER_POOL_ID"

# Build user attributes
USER_ATTRS=""
[ -n "$ADMIN_EMAIL" ] && USER_ATTRS="Name=email,Value=${ADMIN_EMAIL} Name=email_verified,Value=true"

# Create user
echo "Creating user: $USERNAME"
if [ -n "$USER_ATTRS" ]; then
  aws cognito-idp admin-create-user \
    --user-pool-id "$USER_POOL_ID" \
    --username "$USERNAME" \
    --user-attributes $USER_ATTRS \
    --message-action SUPPRESS \
    --no-cli-pager > /dev/null 2>&1 || { echo "Error: Failed to create user"; exit 1; }
else
  aws cognito-idp admin-create-user \
    --user-pool-id "$USER_POOL_ID" \
    --username "$USERNAME" \
    --message-action SUPPRESS \
    --no-cli-pager > /dev/null 2>&1 || { echo "Error: Failed to create user"; exit 1; }
fi

# Set password
echo "Setting password..."
aws cognito-idp admin-set-user-password \
  --user-pool-id "$USER_POOL_ID" \
  --username "$USERNAME" \
  --password Admin123! \
  --permanent \
  --no-cli-pager > /dev/null 2>&1 || { echo "Error: Failed to set password"; exit 1; }

echo "✓ User created: ${USERNAME} / Admin123!"
[ -n "$ADMIN_EMAIL" ] && echo "  Email: ${ADMIN_EMAIL}"
