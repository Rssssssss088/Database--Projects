import secrets

# Generate a random secret key of 32 bytes (256 bits)
secret_key = secrets.token_hex(32)

# Print the generated secret key
print("Generated Secret Key:", secret_key)
