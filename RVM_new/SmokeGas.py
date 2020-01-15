import math

class SmokeGas:

    def ro(self, t):
        if (t < 100):
            return 1.295
        if (100 <= t < 200):
            return 0.95
        if (200 <= t < 300):
            return 0.748
        if (300 <= t < 400):
            return 0.617
        if (400 <= t < 500):
            return 0.525
        if (500 <= t < 600):
            return 0.457
        if (600 <= t < 700):
            return 0.405
        if (700 <= t < 800):
            return 0.363
        if (800 <= t < 900):
            return 0.33
        if (900 <= t < 1000):
            return 0.301
        if (1000 <= t < 1100):
            return 0.275
        if (1100 <= t < 1200):
            return 0.257
        return 0.24

    def cp(self, t):
        if (t < 100):
            return 1.042
        if (100 <= t < 200):
            return 1.068
        if (200 <= t < 300):
            return 1.097
        if (300 <= t < 400):
            return 1.122
        if (400 <= t < 500):
            return 1.151
        if (500 <= t < 600):
            return 1.185
        if (600 <= t < 700):
            return 1.214
        if (700 <= t < 800):
            return 1.239
        if (800 <= t < 900):
            return 1.264
        if (900 <= t < 1000):
            return 1.29
        if (1000 <= t < 1100):
            return 1.306
        if (1100 <= t < 1200):
            return 1.323
        return 1.34

    def lamb(self, t):
        if (t < 100):
            return 0.0228
        if (100 <= t < 200):
            return 0.0313
        if (200 <= t < 300):
            return 0.0401
        if (300 <= t < 400):
            return 0.0484
        if (400 <= t < 500):
            return 0.057
        if (500 <= t < 600):
            return 0.0656
        if (600 <= t < 700):
            return 0.0742
        if (700 <= t < 800):
            return 0.0827
        if (800 <= t < 900):
            return 0.0915
        if (900 <= t < 1000):
            return 0.1
        if (1000 <= t < 1100):
            return 0.109
        if (1100 <= t < 1200):
            return 0.1175
        return 0.1262

    def a(self, t):
        if (t < 100):
            return 16.9*10**(-6)
        if (100 <= t < 200):
            return 30.8*10**(-6)
        if (200 <= t < 300):
            return 48.9*10**(-6)
        if (300 <= t < 400):
            return 69.9*10**(-6)
        if (400 <= t < 500):
            return 94.3*10**(-6)
        if (500 <= t < 600):
            return 121.1*10**(-6)
        if (600 <= t < 700):
            return 150.9*10**(-6)
        if (700 <= t < 800):
            return 183.8*10**(-6)
        if (800 <= t < 900):
            return 219.7*10**(-6)
        if (900 <= t < 1000):
            return 258.0*10**(-6)
        if (1000 <= t < 1100):
            return 303.4*10**(-6)
        if (1100 <= t < 1200):
            return 345.5*10**(-6)
        return 392.4*10**(-6)

    def mu(self, t):
        if (t < 100):
            return 15.8*10**(-6)
        if (100 <= t < 200):
            return 20.4*10**(-6)
        if (200 <= t < 300):
            return 24.5*10**(-6)
        if (300 <= t < 400):
            return 28.2*10**(-6)
        if (400 <= t < 500):
            return 31.7*10**(-6)
        if (500 <= t < 600):
            return 34.8*10**(-6)
        if (600 <= t < 700):
            return 37.9*10**(-6)
        if (700 <= t < 800):
            return 40.7*10**(-6)
        if (800 <= t < 900):
            return 43.4*10**(-6)
        if (900 <= t < 1000):
            return 45.9*10**(-6)
        if (1000 <= t < 1100):
            return 48.4*10**(-6)
        if (1100 <= t < 1200):
            return 50.7*10**(-6)
        return 53.0*10**(-6)

    def nu(self, t):
        if (t < 100):
            return 12.2*10**(-6)
        if (100 <= t < 200):
            return 21.54*10**(-6)
        if (200 <= t < 300):
            return 32.8*10**(-6)
        if (300 <= t < 400):
            return 45.81*10**(-6)
        if (400 <= t < 500):
            return 60.38*10**(-6)
        if (500 <= t < 600):
            return 76.3*10**(-6)
        if (600 <= t < 700):
            return 93.61*10**(-6)
        if (700 <= t < 800):
            return 112.1*10**(-6)
        if (800 <= t < 900):
            return 131.8*10**(-6)
        if (900 <= t < 1000):
            return 152.5*10**(-6)
        if (1000 <= t < 1100):
            return 174.3*10**(-6)
        if (1100 <= t < 1200):
            return 197.1*10**(-6)
        return 221.0*10**(-6)

    def prandtlNumber(self, t):
        if (t < 100):
            return 0.72
        if (100 <= t < 200):
            return 0.69
        if (200 <= t < 300):
            return 0.67
        if (300 <= t < 400):
            return 0.65
        if (400 <= t < 500):
            return 0.64
        if (500 <= t < 600):
            return 0.63
        if (600 <= t < 700):
            return 0.62
        if (700 <= t < 800):
            return 0.61
        if (800 <= t < 900):
            return 0.6
        if (900 <= t < 1000):
            return 0.59
        if (1000 <= t < 1100):
            return 0.58
        if (1100 <= t < 1200):
            return 0.57
        return 0.56