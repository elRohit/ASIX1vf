import locale
locale.setlocale(locale.LC_ALL, 'ca_ES.UTF-8')
from datetime import *

avui = datetime.now()
print("{:%A %#d de %B del %Y}".format(avui))
