import datetime
import os
import Calculator
import Results

from PyQt5.QtWidgets import *
from PyQt5 import uic, QtCore, QtGui

class MainWindow(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        uic.loadUi('MainWindow.ui', self)
        self.setWindowFlags(QtCore.Qt.Window | QtCore.Qt.WindowMinimizeButtonHint | QtCore.Qt.WindowCloseButtonHint | \
                            QtCore.Qt.CustomizeWindowHint)
        self.setFixedSize(self.width(), self.height())
        self.setWindowIcon(QtGui.QIcon('Icons/thermometer.ico'))
        self.runCalculationsButton.clicked.connect(self.showResults)
        self.openFileButton.clicked.connect(self.readDataFile)
        self.saveInputDataButton.clicked.connect(self.saveDataToFile)

    def loadData(self):
        gg = self.GGdoubleSpinBox.value()
        tg = self.TGdoubleSpinBox.value()
        pg = self.PGspinBox.value()
        deg = self.DEGdoubleSpinBox.value()
        neg = self.NEGspinBox.value()
        nky = self.NKYspinBox.value()
        lg = self.LGdoubleSpinBox.value()
        sg = self.SGdoubleSpinBox.value()
        fg = self.FGdoubleSpinBox.value()
        feg = self.FEGdoubleSpinBox.value()
        mg = self.MGdoubleSpinBox.value()
        gb = self.GBdoubleSpinBox.value()
        tb = self.TBdoubleSpinBox.value()
        pb = self.PBspinBox.value()
        deb = self.DEBdoubleSpinBox.value()
        neb = self.NEBspinBox.value()
        nke = self.NKEspinBox.value()
        lb = self.LBdoubleSpinBox.value()
        sb = self.SBdoubleSpinBox.value()
        fb = self.FBdoubleSpinBox.value()
        mb = self.MBdoubleSpinBox.value()
        me = self.MEdoubleSpinBox.value()
        betact = self.BETACTdoubleSpinBox.value()
        hpg = self.HPGdoubleSpinBox.value()
        fpg = self.FPGdoubleSpinBox.value()
        hn = self.HNdoubleSpinBox.value()
        cped1 = self.CPED1comboBox.currentIndex()+1
        cped2 = self.CPED2comboBox.currentIndex()+1
        matep = self.MATEPcomboBox.currentIndex()+1
        count = self.getCountPasses()
        self.__calc = Calculator.Calculator(gg, tg, pg, deg, neg, nky, lg, sg, fg, feg, mg, gb, tb, pb, deb, neb, nke, \
                                            lb, sb, fb, mb, me, betact, hpg, fpg, hn, cped1, cped2, matep, count)

    def readDataFile(self):
        default_readdir = os.getcwd() + '/DATA'
        if not os.path.isdir(default_readdir):
            os.makedirs(default_readdir)
        file_name = QFileDialog.getOpenFileName(self, 'Считать данные из файла', default_readdir,'*.dat', )[0]
        if file_name:
            self.setData(file_name)

    def setData(self, file_name):
        with open(file_name) as f:
            content = f.read()
        content.replace('\n', '')
        arr = content.split()
        self.GGdoubleSpinBox.setValue(float(arr[0]))
        self.TGdoubleSpinBox.setValue(float(arr[1]))
        self.PGspinBox.setValue(int(float(arr[2])))
        self.DEGdoubleSpinBox.setValue(float(arr[3]))
        self.NEGspinBox.setValue(int(float(arr[4])))
        self.NKYspinBox.setValue(int(float(arr[5])))
        self.LGdoubleSpinBox.setValue(float(arr[6]))
        self.SGdoubleSpinBox.setValue(float(arr[7]))
        self.FGdoubleSpinBox.setValue(float(arr[8]))
        self.FEGdoubleSpinBox.setValue(float(arr[9]))
        self.MGdoubleSpinBox.setValue(float(arr[10]))
        self.GBdoubleSpinBox.setValue(float(arr[11]))
        self.TBdoubleSpinBox.setValue(float(arr[12]))
        self.PBspinBox.setValue(int(float(arr[13])))
        self.DEBdoubleSpinBox.setValue(float(arr[14]))
        self.NEBspinBox.setValue(int(float(arr[15])))
        self.NKEspinBox.setValue(int(float(arr[16])))
        self.LBdoubleSpinBox.setValue(float(arr[17]))
        self.SBdoubleSpinBox.setValue(float(arr[18]))
        self.FBdoubleSpinBox.setValue(float(arr[19]))
        self.MBdoubleSpinBox.setValue(float(arr[20]))
        self.MEdoubleSpinBox.setValue(float(arr[21]))
        self.BETACTdoubleSpinBox.setValue(float(arr[22]))
        self.HPGdoubleSpinBox.setValue(float(arr[23]))
        self.FPGdoubleSpinBox.setValue(float(arr[24]))
        self.HNdoubleSpinBox.setValue(float(arr[25]))
        self.CPED1comboBox.setCurrentIndex(int(float(arr[26]))-1)
        self.CPED2comboBox.setCurrentIndex(int(float(arr[27]))-1)
        self.MATEPcomboBox.setCurrentIndex(int(float(arr[28]))-1)
        self.setCountPasses(int(float(arr[29]))-1)

    def saveDataToFile(self):
        now = datetime.datetime.now()
        default_savedir = os.getcwd() + '/DATA'
        default_filename = 'DATA__'+now.strftime("%d.%m.%Y__%H-%M-%S")
        if not os.path.isdir(default_savedir):
            os.makedirs(default_savedir)
        file_name = QFileDialog.getSaveFileName(self, 'Сохранить входные данные',  default_savedir + '/' + \
                                                default_filename, '*.dat')[0]
        if file_name:
            self.saveData(file_name)

    def saveData(self, file_name):
        f = open(file_name,'w')
        f.write(str(self.GGdoubleSpinBox.value())+'\n')
        f.write(str(self.TGdoubleSpinBox.value())+'\n')
        f.write(str(self.PGspinBox.value())+'\n')
        f.write(str(self.DEGdoubleSpinBox.value())+'\n')
        f.write(str(self.NEGspinBox.value())+'\n')
        f.write(str(self.NKYspinBox.value())+'\n')
        f.write(str(self.LGdoubleSpinBox.value())+'\n')
        f.write(str(self.SGdoubleSpinBox.value())+'\n')
        f.write(str(self.FGdoubleSpinBox.value())+'\n')
        f.write(str(self.FEGdoubleSpinBox.value())+'\n')
        f.write(str(self.MGdoubleSpinBox.value())+'\n')
        f.write(str(self.GBdoubleSpinBox.value())+'\n')
        f.write(str(self.TBdoubleSpinBox.value())+'\n')
        f.write(str(self.PBspinBox.value())+'\n')
        f.write(str(self.DEBdoubleSpinBox.value())+'\n')
        f.write(str(self.NEBspinBox.value())+'\n')
        f.write(str(self.NKEspinBox.value())+'\n')
        f.write(str(self.LBdoubleSpinBox.value())+'\n')
        f.write(str(self.SBdoubleSpinBox.value())+'\n')
        f.write(str(self.FBdoubleSpinBox.value())+'\n')
        f.write(str(self.MBdoubleSpinBox.value())+'\n')
        f.write(str(self.MEdoubleSpinBox.value())+'\n')
        f.write(str(self.BETACTdoubleSpinBox.value())+'\n')
        f.write(str(self.HPGdoubleSpinBox.value())+'\n')
        f.write(str(self.FPGdoubleSpinBox.value())+'\n')
        f.write(str(self.HNdoubleSpinBox.value())+'\n')
        f.write(str(self.CPED1comboBox.currentIndex()+1)+'\n')
        f.write(str(self.CPED2comboBox.currentIndex()+1)+'\n')
        f.write(str(self.MATEPcomboBox.currentIndex()+1)+'\n')
        f.write(str(self.getCountPasses()))
        f.close()

    def showResults(self):
        self.loadData()
        self.__calc.compute()
        gg = self.__calc.getGG()
        pg = self.__calc.getPG()
        tg = self.__calc.getTG()
        gb = self.__calc.getGB()
        pb = self.__calc.getPB()
        tb = self.__calc.getTB()
        neg = self.__calc.getNEG()
        nke = self.__calc.getNKE()
        nkyp = self.__calc.getNKYP()
        degp = self.__calc.getDEGP()
        sgp = self.__calc.getSGP()
        nkyr = self.__calc.getNKYR()
        debp = self.__calc.getDEBP()
        sbp = self.__calc.getSBP()
        fgp = self.__calc.getFGP()
        fbp = self.__calc.getFBP()
        fsum = self.__calc.getFSUM()
        tgres = self.__calc.getTGRES()
        tbres = self.__calc.getTBRES()
        dltpg = self.__calc.getDLTPG()
        dpg = self.__calc.getDPG()
        dltpb = self.__calc.getDLTPB()
        dpb = self.__calc.getDPB()
        qogp = self.__calc.getQOGP()
        qbp = self.__calc.getQBP()
        ril = self.__calc.getReinoldsInputColdThermofor()
        rihg = self.__calc.getReinoldsInputHotThermofor()
        resr = self.__calc.getRESR()
        rebsr = self.__calc.getREBSR()
        mat = self.__calc.getMAT()
        betact1 = self.__calc.getBETACT1()
        cped1 = self.__calc.getCPED1()
        cped2 = self.__calc.getCPED2()
        count = self.__calc.getCOUNT()
        alfag = self.__calc.getHeatCoefColdThermofor()
        alfab = self.__calc.getHeatCoefHotThermofor()
        nusseltg = self.__calc.getNusseltColdThermofor()
        nusseltb = self.__calc.getNusseltHotThermofor()
        prandtlg = self.__calc.getPrandtlColdThermofor()
        prandtlb = self.__calc.getPrandtlHotThermofor()
        self.__resDialog = Results.Results(self.__calc.getCOE())
        self.__resDialog.updateContent(gg, pg, tg, gb, pb, tb, neg, nke, nkyp, degp, sgp, nkyr, debp, sbp, fgp, fbp, \
                                       fsum, tgres, tbres, dltpg, dpg, dltpb, dpb, qogp, qbp, ril, rihg, resr, rebsr, \
                                       mat, betact1, cped1, cped2, count, alfag, alfab, nusseltg, nusseltb, prandtlg, \
                                       prandtlb)
        self.__resDialog.show()

    def getCountPasses(self):
        if (self.OnePassRadioButton.isChecked()):
            return 1
        if (self.TwoPassRadioButton.isChecked()):
            return 2
        return 1

    def setCountPasses(self, passes):
        if (passes == 1):
            self.OnePassRadioButton.setChecked(True)
        if (passes == 2):
            self.TwoPassRadioButton.setChecked(True)