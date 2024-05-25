# asennustesti.py
#
# Tämä on asennustesti, joka tulostaa Pythonin, Robot Frameworkin ja 
# muiden käytettyjen kirjastojen versiot. Tämä tiedosto on tarkoitettu
# käytettäväksi testattaessa, että kaikki tarvittavat kirjastot on asennettu.

# Tulostetaan Pythonin versio
import sys
print('Python:', sys.version)

# Tulostetaan Robot Frameworkin ja muiden käytettyjen kirjastojen versiot
try:
    import robot
    print('Robot Framework:', robot.__version__)
except ImportError:
    print('robot-moduulia ei löydy')

# Tarkistetaan, onko käytössä Browser-, RequestsLibrary- ja CryptoLibrary-moduulit
try:
    import Browser
    print('Browser:', Browser.__version__)
except ImportError:
    print('Browser-moduulia ei löydy')

try:
    import RequestsLibrary
    import requests
    print('requests:', requests.__version__)
except ImportError:
    print('RequestsLibrary- tai requests-moduulia ei löydy')

try:
    import CryptoLibrary
    print('CryptoLibrary:', CryptoLibrary.__version__)
except ImportError:
    print('CryptoLibrary-moduulia ei löydy')
 