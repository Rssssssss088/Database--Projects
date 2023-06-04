import os

secret_key = os.environ.get('SECRET_KEY')
wtf_csrf_secret_key = os.environ.get('WTF_CSRF_SECRET_KEY')

print("SECRET_KEY:", secret_key)
print("WTF_CSRF_SECRET_KEY:", wtf_csrf_secret_key)
