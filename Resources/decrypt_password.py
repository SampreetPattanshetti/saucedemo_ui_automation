from cryptography.fernet import Fernet
from robot.api.deco import keyword

@keyword
def load_secret_key():
    return open("secret.key", "rb").read()

@keyword
def decrypt_password(encrypted_password):
    bytePwd = bytes(str(encrypted_password), encoding='utf8')
    key = load_secret_key()
    f = Fernet(key)
    decrypted_password = f.decrypt(bytePwd)
    return str(decrypted_password.decode("utf-8"))
