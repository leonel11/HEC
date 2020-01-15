import numpy as np
import math
import SmokeGas

from Modes import *
from Constants import *
from CoeList import *

class Calculator:

    def __init__(self, gg: float, tg: int, pg: int, deg: float, neg: int, nky: int, lg: float, sg: float, fg: float, \
                 feg: float, mg: float, gb: float, tb: int, pb: int, deb: float, neb: int, nke: int, lb: float, \
                 sb: float, fb: float, mb: float, me: float, betact: float, hpg: float, fpg: float, hn: float, \
                 cped1: int, cped2: int, matep: int, count: int):
        self.__gg = gg
        self.__tg = tg
        self.__pg = pg
        self.__deg = deg
        self.__neg = neg
        self.__nky = nky
        self.__lg = lg
        self.__sg = sg
        self.__fg = fg
        self.__feg = feg
        self.__mg = mg
        self.__gb = gb
        self.__tb = tb
        self.__pb = pb
        self.__deb = deb
        self.__neb = neb
        self.__nke = nke
        self.__lb = lb
        self.__sb = sb
        self.__fb = fb
        self.__mb = mb
        self.__me = me
        self.__betact = betact
        self.__hpg = hpg
        self.__fpg = fpg
        self.__hn = hn
        self.__cped1 = cped1
        self.__cped2 = cped2
        self.__matep = matep
        self.__count = count
        self.initVariables()

    def initVariables(self):
        self.__dltpg = 0.0
        self.__dltpb = 0.0
        self.__dpg = 0.0
        self.__dpb = 0.0
        self.__tgsr = 0.0
        self.__tbsr = 0.0
        self.__qogp = 0.0
        self.__qbp = 0.0
        self.__tgcur = self.__tg
        self.__tbcur = self.__tb
        self.__tgres = 0.0
        self.__tbres = 0.0
        self.__tgprev = Constants.MIN_T
        self.__tbprev = Constants.MAX_T
        self.__coe = CoeList()
        self.__smokegas = SmokeGas.SmokeGas()

    def initArrays(self, tg, tb):
        self.__tgmatr = np.zeros((92, 27))
        self.__tbmatr = np.zeros((92, 27))
        self.__pgmatr = np.zeros((92, 27))
        self.__pbmatr = np.zeros((92, 27))
        self.__tarr = np.zeros(32)
        self.__parr = np.zeros(32)
        self.__tarr1 = np.zeros(92)
        self.__parr1 = np.zeros(92)
        self.__qogmatr = np.zeros((92, 32))
        self.__qogmatr1 = np.zeros((92, 32))
        self.__qogsmatr = np.zeros((92, 32))
        self.__qbmatr = np.zeros((92, 32))
        self.__qbmatr1 = np.zeros((92, 32))
        self.__qbsmatr = np.zeros((92, 32))
        self.__rematr = np.zeros((92, 32))
        self.__rebmatr = np.zeros((92, 32))
        self.__rearr1 = np.zeros(32)
        self.__rebarr1 = np.zeros(92)
        self.fillArrays(tg, tb)

    def fillArrays(self, tg, tb):
        for j in range(1, self.__nky+1):
            self.__tgmatr[0][j] = tg
            self.__pgmatr[0][j] = self.__pg
        for i in range(1, self.__nke+1):
            self.__tbmatr[i][0] = tb
            self.__pbmatr[i][0] = self.__pb

    def compute(self):
        idx_begin = 1
        idx_end = self.__count+1
        for idx in range(idx_begin, idx_end):
            if (idx > idx_begin and idx < idx_end):
                self.fitHeatBalance()
            if (idx == idx_begin):
                self.initArrays(self.__tgcur, self.__tbcur)
                self.makePass(Modes.PASS)
            if self.isGasGasThermofor():
                w = max(self.__ewg, self.__ewb)
                wmin = min(self.__ewg, self.__ewb)
                self.__coe.addGagGasCoeInList(w, wmin, self.__tb, self.__tbres, self.__tg)
            else:
                self.__coe.addCoeInList(self.__tb, self.__tbres, self.__tg)

    def fitHeatBalance(self):
        while ((abs(self.__tgcur - self.__tgprev) >= Constants.EPS) or
                   (abs(self.__tbprev - self.__tbcur) >= Constants.EPS)):
            self.initArrays(self.__tg, self.__tbcur)
            self.makePass(Modes.COLD)
            self.initArrays(self.__tgcur, self.__tb)
            self.makePass(Modes.HOT)
        self.calcLossPressure()

    def calcLossPressure(self):
        pgsr = self.__parr[self.__nky] / self.__nky
        pbsr = self.__parr1[self.__nke] / self.__nke
        self.__dltpg += self.__pgmatr[0][1] - pgsr
        self.__dltpb += self.__pbmatr[1][0] - pbsr
        self.__dpg += pgsr / self.__pgmatr[0][1]
        self.__dpb += pbsr / self.__pbmatr[1][0]

    def makePass(self, mode):
        for i in range(1, self.__nke+1):
            for j in range(1, self.__nky+1):
                tg1 = self.__tgmatr[i-1][j]
                if self.__cped1 == 1:
                    rog = self.__pgmatr[i-1][j] / (29.27*(tg1 + 273.1))
                if self.__cped1 == 2:
                    rog = 1001.67 - tg1*0.163947 - tg1*tg1*0.002619
                if self.__cped1 == 3:
                    rog = -0.64303*tg1 + 921.067
                if self.__cped1 == 4:
                    rog = self.__smokegas.ro(tg1)
                wg = 2.0 * self.__gg / (rog * self.__neg * self.__nky * self.__sg)
                #wg = self.__gg / (rog * self.__neg * self.__nky * self.__sg)
                if self.__cped1 == 1:
                    mug = (17.281 + (tg1*0.0477) - (tg1*tg1*2e-5) + (tg1**3*7e-9)) / 1000000.0
                    njg = mug/rog
                    lamg = (2.4092 + (tg1*8.5e-3) - (tg1*tg1*5e-6) + (tg1**3*2e-9)) / 100.0
                    self.__prandtlg = 0.7067 - (tg1*2e-4) + (tg1*tg1*3e-8) + (tg1**3*2e-9) - (tg1**4*3e-12) + \
                                      (tg1**5*2e-15) - (tg1**6*4e-19)
                elif self.__cped1 == 2:
                    njg = ((1.78311 - 0.05548*tg1 + 0.001*tg1*tg1 - 9.2918e-6*tg1**3 + 3.3508e-8*tg1**4)) / 1000000.0
                    lamg = 0.560797 + 0.0019284*tg1 - 7.07446e-6*tg1*tg1
                    self.__prandtlg = 13.4443 - 0.467137*tg1 + 0.008843*tg1*tg1 - 8.3934e-5*tg1**3 + 3.05653e-7*tg1**4
                elif self.__cped1 == 3:
                    njg = (592818.0*tg1**(-2.348241)) / 1000000.0
                    lamg = -6.9091e-5*tg1 + 0.1288
                    self.__prandtlg = 4527230.0*tg1**(-2.18017)
                else:
                    mug = (15.878 + (tg1*0.0464) - (tg1*tg1*2e-5) + (tg1**3*7e-9)) / 1000000.0
                    njg = mug / rog
                    lamg = (2.2829 + (tg1*8.5e-3) - (tg1*tg1*3e-8) + (tg1**3*4e-11)) / 100.0
                    self.__prandtlg = 0.7199 - (tg1*3e-4) + (tg1*tg1*3e-7) + (tg1**3*3e-10) - (tg1**4*1e-12) + \
                                      (tg1**5*1e-15) - (tg1**8*3e-19)
                self.__rematr[i][j] = wg * self.__deg / njg
                if self.__cped1 == 3:
                    nug = 0.408 * self.__rematr[i][j]**0.5846 * self.__prandtlg**self.__mg * 0.5**0.25
                elif self.__cped1 == 4:
                    nug = self.__smokegas.nu(tg1)
                else:
                    nug = 0.001888 * self.__rematr[i][j]**1.1717 * self.__prandtlg**self.__mg
                self.__alfag = nug*lamg / self.__deg
                tb1 = self.__tbmatr[i][j-1]
                if self.__cped2 == 1:
                    rob = self.__pbmatr[i][j-1] / (29.27*(tb1 + 273.1))
                if self.__cped2 == 2:
                    rob = 1001.67 - tb1*0.163947 - tb1*tb1*0.002619
                if self.__cped2 == 3:
                    rob = -0.64303*tb1 + 921.067
                if self.__cped2 == 4:
                    rob = self.__smokegas.ro(tb1)
                wb = self.__gb / (rob * self.__nke * self.__neb * self.__sb)
                if self.__cped2 == 1:
                    lamb = (2.4092 + (tb1*8.5e-3) - (tb1*tb1*5e-6) + (tb1**3*2e-9))/100.0
                    mub = (17.281 + (tb1*4.77e-2) - (tb1*tb1*2e-5) + (tb1**3*7e-9))/1000000.0
                    njb = mub/rob
                    self.__prandtlb = 0.7067 - (tb1*2e-4) + (tb1*tb1*3e-8) + (tb1**3*2e-9) - (tb1**4*3e-12) + \
                                      (tb1**5*2e-15) - (tb1**6*4e-19)
                elif self.__cped2 == 2:
                    lamb = 0.560797 + 0.0019284*tb1 - 7.0746e-6*tb1*tb1
                    njb = (1.78311 - 0.05548*tb1 + 0.001*tb1*tb1 - 9.2918e-6*tb1**3 + 3.3508e-8*tb1**4) / 1000000.0
                    self.__prandtlb = 13.4443 - 0.467137*tb1 + 0.008843*tb1*tb1 - 8.3934e-5*tb1**3 + 3.05653e-7*tb1**4
                elif self.__cped2 == 3:
                    lamb = -6.9091e-5*tb1 + 1.76927
                    njb = 592818.0*tb1**(-2.34824) / 1000000.0
                    self.__prandtlb = 4527230.0*tb1**(-2.18017)
                else:
                    lamb = (2.2829 + (tb1*8.5e-3) - (tb1*tb1*3e-8) + (tb1**3*4e-11)) / 100.0
                    mub = (15.878 + (tb1*0.0464) - (tb1*tb1*2e-5) + (tb1**3*5e-9)) / 1000000.0
                    njb = mub / rob
                    self.__prandtlb = 0.7199 - (tb1*3e-4) + (tb1*tb1*3e-7) + (tb1**3*3e-10) - (tb1**4*1e-12) + \
                                      (tb1**5*1e-15) - (tb1**6*3e-19)
                self.__rebmatr[i][j] = wb * self.__deb / njb
                self.__alfab = 0.11613*self.__rebmatr[i][j]**0.7148*self.__prandtlb**self.__mb*lamb/self.__deb
                fi = self.__alfag/self.__alfab
                deltg = (tb1 - tg1) / (1.0 + fi)
                tct = tg1 - deltg
                if self.__matep == 1:
                    lamct = 0.0140857*tct + 14.82
                    self.__mat = "Сталь12x18н10т"
                if self.__matep == 2:
                    lamct = 152.702 + 0.599547*tct - 4.50183e-3*tct*tct + tct**3*1.37909e-5 - tct**4*1.42909e-8
                    self.__mat = "Алюминий"
                if self.__matep == 3:
                    lamct = -0.0475*tct + 65.09
                    self.__mat = "Углерод"
                deltct = self.__alfag * deltg * self.__betact /lamct
                deltsum = tb1-tg1
                deltg = (deltsum-deltct)/(1.0+fi)
                deltb = (deltsum-deltct)*fi/(1.0+fi)
                if self.__cped1 == 2:
                    deltng = deltg
                    deltnb = deltb
                    qpg = 0.0
                else:
                    mg = (2.0*self.__alfag/(lamct*self.__betact))**0.5
                    e1 = math.exp(mg*self.__hpg)
                    e2 = math.exp(-mg*self.__hpg)
                    th = (e1-e2) / (e1+e2)
                    psipg = th/(mg*self.__hpg)
                    bh = ((self.__alfag+self.__alfab)/(lamct*self.__betact))**0.5*self.__hn
                    ex1 = math.exp(bh)
                    ex2 = math.exp(-bh)
                    thbh = (ex1-ex2) / (ex1+ex2)
                    psin = thbh/bh
                    fpg = self.__hpg/self.__hn
                    qpg = ((tb1-tg1)*self.__alfag*self.__hn*fpg*psin*4.0*0.01)/(psipg*fpg+psin*(fi+1.0))
                    if self.__matep == 1:
                        cm = 0.000244*tct + 0.4456
                    if self.__matep == 2:
                        cm = 1.24 - (tct*0.00325) + (tct*tct*0.0000205) - (tct**3*3e-8)
                    if self.__matep == 3:
                        cm = 0.4884 + (tct*3.35001e-5) + (tct*tct*7.17857e-7)
                    betatn = qpg/(cm*self.__me*1000.0)
                    #deltng = deltg+betatn
                    #deltnb = deltb-betatn
                    deltng = deltg - betatn
                    deltnb = deltb + betatn
                self.__qogmatr[i][j] += self.__alfag*self.__feg*deltng + qpg
                self.__qbmatr[i][j] += self.__alfab*self.__fb*deltnb
                if self.__cped1 == 1:
                    cpg = 1.004 + (tg1*7e-6) + (tg1*tg1*6e-7) - (tg1**3*7e-10) + (tg1**4*2e-13)
                elif self.__cped1 == 2:
                    cpg = 4.21085 - (tg1*0.0020377) + (tg1*tg1*3.08919e-5) - (tg1**3*9.615539e-8)
                elif self.__cped1 == 3:
                    cpg = 1.76927 + 0.00352424*tg1
                else:
                    cpg = 1.0429 + (tg1*2e-4) + (tg1*tg1*2e-7) - (tg1**3*3e-10) + (tg1**4*6e-14)
                if self.__cped2 == 1:
                    cpb = 1.004 + (tb1*7e-6) + (tb1*tb1*6e-7) - (tb1**3*7e-10) + (tb1**4*2e-13)
                elif self.__cped2 == 2:
                    cpb = 4.21085 - (tb1*0.0020377) + (tb1*tb1*3.08919e-5) - (tb1**3*9.615539e-8)
                elif self.__cped2 == 3:
                    cpb = 1.76927 + 0.00352424*tb1
                else:
                    cpb = 1.0429 + (tb1*2e-4) + (tb1*tb1*2e-7) - (tb1**3*3e-10) + (tb1**4*6e-14)
                self.__ewg = cpg * self.__gg
                self.__ewb = cpb * self.__gb
                mge = self.__gg / (self.__neg*self.__nky)
                mbe = self.__gb / (self.__neb*self.__nke)
                betatg = self.__qogmatr[i][j] / (cpg*mge*1000.0)
                betatb = self.__qbmatr[i][j] / (cpb*mbe*1000.0)
                delpg = (0.3*self.__lg*rog*wg*wg) / (self.__deg*2*9.810001)
                ksib = 0.419834*self.__rebmatr[i][j]**(-0.110047)
                delpb = (self.__lb*ksib*rob*wb*wb) / (self.__deb*2*9.810001)
                self.__pgmatr[i][j] = self.__pgmatr[i-1][j] - delpg
                self.__tgmatr[i][j] = tg1 + betatg
                self.__pbmatr[i][j] = self.__pbmatr[i][j-1] - delpb
                self.__tbmatr[i][j] = tb1 - betatb
                self.__qogmatr1[i][j] = self.__qogmatr1[i][j-1] + self.__qogmatr[i][j]
                self.__qbmatr1[i][j] = self.__qbmatr1[i][j-1] + self.__qbmatr[i][j]
        for k in range(1, self.__nky+1):
            self.__tarr[k] = self.__tarr[k-1] + self.__tgmatr[self.__nke][k]
            self.__parr[k] = self.__parr[k-1] + self.__pgmatr[self.__nke][k]
            self.__rearr1[k] = self.__rearr1[k-1] + self.__rematr[self.__nke][k]
        for i in range(1, self.__nke+1):
            self.__tarr1[i] = self.__tarr1[i-1] + self.__tbmatr[i][self.__nky]
            self.__parr1[i] = self.__parr1[i-1] + self.__pbmatr[i][self.__nky]
            self.__rebarr1[i] = self.__rebarr1[i-1] + self.__rebmatr[i][self.__nky]
            self.__qogsmatr[i][self.__nky] = self.__qogsmatr[i-1][self.__nky] + self.__qogmatr1[i][self.__nky]
            self.__qbsmatr[i][self.__nky] = self.__qbsmatr[i-1][self.__nky] + self.__qbmatr1[i][self.__nky]
        self.__reinoldsg = self.__rematr[1][1]
        self.__reinoldsb = self.__rebmatr[1][1]
        self.__resr = self.__rearr1[self.__nky] / self.__nky
        self.__rebsr = self.__rebarr1[self.__nke] / self.__nke
        self.__nusseltg = self.__alfag * self.__deg / lamg
        self.__nusseltb = self.__alfab * self.__deb / lamb
        self.__tgsr = self.__tarr[self.__nky] / self.__nky
        self.__tbsr = self.__tarr1[self.__nke] / self.__nke
        if (mode == Modes.COLD):
            self.__tgprev = self.__tgcur
            self.__tgcur = self.__tgsr
            self.__tbres = self.__tbsr
        if (mode == Modes.HOT):
            self.__tbprev = self.__tbcur
            self.__tbcur = self.__tbsr
            self.__tgres = self.__tgsr
        if (mode == Modes.PASS):
            self.__tgprev = self.__tgcur
            self.__tbprev = self.__tbcur
            self.__tgcur = self.__tgsr
            self.__tbcur = self.__tbsr
            self.__tgres = self.__tgsr
            self.__tbres = self.__tbsr
            self.calcLossPressure()
        self.__qogp = cpg * self.__gg * (self.__tgres - self.__tg)
        self.__qbp = cpb * self.__gb * (self.__tb - self.__tbres)

    def getGG(self):
        res = "%1.3f" % self.__gg
        return res.replace(' ', '')

    def getPG(self):
        res = "%1.3f" % self.__pg
        return res.replace(' ', '')

    def getTG(self):
        res = "%3.2f" % self.__tg
        return res.replace(' ', '')

    def getGB(self):
        res = "%1.3f" % self.__gb
        return res.replace(' ', '')

    def getPB(self):
        res = "%5.0f" % self.__pb
        return res.replace(' ', '')

    def getTB(self):
        res = "%3.2f" % self.__tb
        return res.replace(' ', '')

    def getNEG(self):
        res = str(self.__neg)
        return res.replace(' ', '')

    def getNKE(self):
        res = str(self.__nke)
        return res.replace(' ', '')

    def getNKYP(self):
        res = "%3.0f" % (self.__lg*self.__nke*1000.0)
        return res.replace(' ', '')

    def getDEGP(self):
        res = "%2.2f" % (self.__deg*1000.0)
        return res.replace(' ', '')

    def getSGP(self):
        res = "%3.2f" % (self.__sg*1000000.0)
        return res.replace(' ', '')

    def getNKYR(self):
        res = "%3.0f" % (self.__nky*10.0)
        return res.replace(' ', '')

    def getDEBP(self):
        res = "%1.3f" % (self.__deb*1000.0)
        return res.replace(' ', '')

    def getSBP(self):
        res = "%3.2f" % (self.__sb*1000000.0)
        return res.replace(' ', '')

    def getFGP(self):
        res = "%3.2f" % ((self.__nke*self.__nky*self.__neg)*self.__fg)
        return res.replace(' ', '')

    def getFBP(self):
        res = "%3.2f" % ((self.__nke*self.__nky*self.__neb)*self.__fb)
        return res.replace(' ', '')

    def getFSUM(self):
        res = "%3.2f" % (float(self.getFGP())+float(self.getFBP()))
        return res.replace(' ', '')

    def getMAT(self):
        return self.__mat

    def getBETACT1(self):
        res = str(self.__betact*1000.0)
        return res.replace(' ', '')

    def getTGRES(self):
        res = "%3.2f" %  self.__tgres
        return res.replace(' ', '')

    def getTBRES(self):
        res = "%3.2f" % self.__tbres
        return res.replace(' ', '')

    def getDLTPG(self):
        res = "%5.0f" % self.__dltpg
        return res.replace(' ', '')

    def getDPG(self):
        res = "%1.3f" % self.__dpg
        return res.replace(' ', '')

    def getDLTPB(self):
        res = "%5.0f" % self.__dltpb
        return res.replace(' ', '')

    def getDPB(self):
        res = "%1.3f" % self.__dpb
        return res.replace(' ', '')

    def getQOGP(self):
        res = "%3.2f" % self.__qogp
        return res.replace(' ', '')

    def getQBP(self):
        res = "%3.2f" % self.__qbp
        return res.replace(' ', '')

    def getReinoldsInputColdThermofor(self):
        res = "%6.1f" % self.__reinoldsg
        return res.replace(' ', '')

    def getReinoldsInputHotThermofor(self):
        res = "%6.1f" % self.__reinoldsb
        return res.replace(' ', '')

    def getRESR(self):
        res = "%6.1f" % self.__resr
        return res.replace(' ', '')

    def getREBSR(self):
        res = "%6.1f" % self.__rebsr
        return res.replace(' ', '')

    def getCOUNT(self):
        res = str(self.__count)
        return res.replace(' ', '')

    def getCPED1(self):
        return self.getCPED(self.__cped1)

    def getCPED2(self):
        return self.getCPED(self.__cped2)

    def getCPED(self, cped):
        return {
            1: 'ВОЗДУХ',
            2: 'ВОДА',
            3: 'МАСЛО',
            4: 'ДЫМ. ГАЗ'
        }[cped]

    def isGasGasThermofor(self):
        if ((self.__cped1 == 1 or self.__cped1 == 4) and (self.__cped2 == 1 or self.__cped2 == 4)):
            return True
        else:
            return False

    def getHeatCoefColdThermofor(self):
        res = "%5.3f" % self.__alfag
        return res.replace(' ', '')

    def getHeatCoefHotThermofor(self):
        res = "%5.3f" % self.__alfab
        return res.replace(' ', '')

    def getNusseltColdThermofor(self):
        res = "%5.3f" % self.__nusseltg
        return res.replace(' ', '')

    def getNusseltHotThermofor(self):
        res = "%5.3f" % self.__nusseltb
        return res.replace(' ', '')

    def getPrandtlColdThermofor(self):
        res = "%5.3f" % self.__prandtlg
        return res.replace(' ', '')

    def getPrandtlHotThermofor(self):
        res = "%5.3f" % self.__prandtlb
        return res.replace(' ', '')

    def getCOE(self):
        return self.__coe