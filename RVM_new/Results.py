import datetime
import os

from CoeList import *

from PyQt5.QtWidgets import *
from PyQt5 import uic, QtGui

class Results(QDialog):
    def __init__(self, coelst):
        self.__coes = CoeList()
        self.__coes.setCoeList(coelst)
        QDialog.__init__(self)
        uic.loadUi('ResultsDialog.ui', self)
        self.setFixedSize(self.width(), self.height())
        self.setWindowIcon(QtGui.QIcon('Icons/results.ico'))
        self.saveResultsButton.clicked.connect(self.saveResults)
        self.repairDataButton.clicked.connect(self.close)

    def updateContent(self, gg, pg, tg, gb, pb, tb, neg, nke, nkyp, degp, sgp, nkyr, debp, sbp, fgp, fbp, fsum, tgres, \
                      tbres, dltpg, dpg, dltpb, dpb, qogp, qbp, ril, rihg, resr, rebsr, mat, betact1, cped1, cped2, \
                      count, alfag, alfab, nusseltg, nusseltb, prandtlg, prandtlb):
        self.GGlineEdit.setText(gg)
        self.PGlineEdit.setText(pg)
        self.TGlineEdit.setText(tg)
        self.GBlineEdit.setText(gb)
        self.PBlineEdit.setText(pb)
        self.TBlineEdit.setText(tb)
        self.NEGlineEdit.setText(neg)
        self.NKElineEdit.setText(nke)
        self.NKYPlineEdit.setText(nkyp)
        self.DEGPlineEdit.setText(degp)
        self.SGPlineEdit.setText(sgp)
        self.NKYRlineEdit.setText(nkyr)
        self.DEBPlineEdit.setText(debp)
        self.SBPlineEdit.setText(sbp)
        self.FGPlineEdit.setText(fgp)
        self.FBPlineEdit.setText(fbp)
        self.FSUMlineEdit.setText(fsum)
        self.TGRESlineEdit.setText(tgres)
        self.TBRESlineEdit.setText(tbres)
        self.DLTPGlineEdit.setText(dltpg)
        self.DPGlineEdit.setText(dpg)
        self.DLTPBlineEdit.setText(dltpb)
        self.DPBlineEdit.setText(dpb)
        self.QOGPlineEdit.setText(qogp)
        self.QBPlineEdit.setText(qbp)
        self.ReinoldsInputColdThermoforlineEdit.setText(ril)
        self.ReinoldsInputHotThermoforlineEdit.setText(rihg)
        self.RESRlineEdit.setText(resr)
        self.REBSRlineEdit.setText(rebsr)
        self.MATlineEdit.setText(mat)
        self.BETACT1lineEdit.setText(betact1)
        self.HeatCoefColdThermoforlineEdit.setText(alfag)
        self.HeatCoefHotThermoforlineEdit.setText(alfab)
        self.NusseltColdThermoforlineEdit.setText(nusseltg)
        self.NusseltHotThermoforlineEdit.setText(nusseltb)
        self.PrandtlColdThermoforlineEdit.setText(prandtlg)
        self.PrandtlHotThermoforlineEdit.setText(prandtlb)
        self.COElineEdit.setText(self.__coes.getCoeListInStr())
        self.__cped = cped1 + '-' + cped2
        self.TYPElineEdit.setText(self.__cped)
        self.PASSESlineEdit.setText(count)

    def showResults(self):
        self.show()

    def saveResults(self):
        now = datetime.datetime.now()
        default_savedir = os.getcwd() + '/RESULTS'
        default_filename = 'RESULTS__'+now.strftime("%d.%m.%Y__%H-%M-%S")
        if not os.path.isdir(default_savedir):
            os.makedirs(default_savedir)
        file_name = QFileDialog.getSaveFileName(self, 'Сохранить данные в файл', default_savedir + '/' + \
                                                default_filename, '*.doc')[0]
        if file_name:
            self.saveData(file_name)

    def saveData(self, file_name):
        now = datetime.datetime.now()
        f = open(file_name,'w')
        f.write('                         РАСЧЕТ ТЕПЛООБМЕННИКА   ' + now.strftime("%d.%m.%Y") + '\n\n')
        f.write(' ИСХОДНЫЕ ПАРАМЕТРЫ:\n По стороне холодного теплоносителя\n   Расход..........................................(кг/с)       ' + self.GGlineEdit.text() + '\n')
        f.write('   Давление........................................(кг/м2)      ' + self.PGlineEdit.text() + '\n')
        f.write('   Температура.....................................(град.С)     ' + self.TGlineEdit.text() + '\n')
        f.write(' По стороне горячего теплоносителя\n   Расход..........................................(кг/с)       ' + self.GBlineEdit.text() + '\n')
        f.write('   Давление........................................(кг/м2)      ' + self.PBlineEdit.text() + '\n')
        f.write('   Температура.....................................(град.С)     ' + self.TBlineEdit.text() + '\n')
        f.write(' КОНСТРУКТИВНЫЕ ПАРАМЕТРЫ:\n   Количество элементов в пакете....................шт.         ' + self.NEGlineEdit.text() + '\n')
        f.write('   Количество трубч. каналов в эл-те................шт.         ' + self.NKElineEdit.text() + '\n')
        f.write('   Длина хода по холодной стороне...................мм          ' + self.NKYPlineEdit.text() + '\n')
        f.write('   Гидравлический диаметр...........................мм          ' + self.DEGPlineEdit.text() + '\n')
        f.write('   Площадь сечения канала ..........................мм2         ' + self.SGPlineEdit.text() + '\n')
        f.write('   Длина хода по горячей стороне....................мм          ' + self.NKYRlineEdit.text() + '\n')
        f.write('   Гидравлический диаметр...........................мм          ' + self.DEBPlineEdit.text() + '\n')
        f.write('   Площадь сечения канала...........................мм2         ' + self.SBPlineEdit.text() + '\n')
        f.write(' Суммарная площадь поверхности:\n   по холодной стороне.............................(м2)         ' + self.FGPlineEdit.text() + '\n')
        f.write('   по горячей стороне..............................(м2)         ' + self.FBPlineEdit.text() + '\n')
        f.write('   общая...........................................(м2)         ' + self.FSUMlineEdit.text() + '\n')
        f.write(' Материал элементов:\n   Материал:            ' + self.MATlineEdit.text() + '\n')
        f.write('   Толщина (мм.):       ' + self.BETACT1lineEdit.text() + '\n')
        f.write(' ОСОБЕННОСТИ ТЕПЛООБМЕННИКА:\n   Тип:                 ' + self.__cped + '\n')
        f.write('   Число проходов:      ' + self.PASSESlineEdit.text() + '\n\n')
        f.write(' РЕЗУЛЬТАТЫ РАСЧЕТА:\n   Температура (сред.) по хол. стор. на выходе.....(град.С)     ' + self.TGRESlineEdit.text() + '\n')
        f.write('   Температура (сред.) по гор. стор. на выходе.....(град.С)     ' + self.TBRESlineEdit.text() + '\n')
        f.write(self.__coes.getCoeListForReport())
        f.write('   Потери давления:\n    по холодной стороне теплоносителя\n   абсолютные......................................(кг/м2)      ' + self.DLTPGlineEdit.text() +  '\n')
        f.write('   относительные...................................(%)          ' + self.DPGlineEdit.text() + '\n')
        f.write('    по горячей стороне теплоносителя\n   абсолютные......................................(кг/м2)      ' + self.DLTPBlineEdit.text() + '\n')
        f.write('   относительные...................................(%)          ' + self.DPBlineEdit.text() + '\n')
        f.write('   Суммарный теплосъем для теплоносителя:\n    по холодной стороне............................(квт)        ' + self.QOGPlineEdit.text() + '\n')
        f.write('    по горячей стороне.............................(квт)        ' + self.QBPlineEdit.text() + '\n')
        f.write('   Коэффициент теплоотдачи:\n    по холодной стороне.........................................' + self.HeatCoefColdThermoforlineEdit.text() + '\n')
        f.write('    по горячей стороне..........................................' + self.HeatCoefHotThermoforlineEdit.text() + '\n')
        f.write('   Число Рейнольдса:\n    на входе по холодной стороне................................' + self.ReinoldsInputColdThermoforlineEdit.text() + '\n')
        f.write('    на входе по горячей стороне.................................' + self.ReinoldsInputHotThermoforlineEdit.text() + '\n')
        f.write('    сред. на выходе по холодной стороне.........................' + self.RESRlineEdit.text() + '\n')
        f.write('    сред. на выходе по горячей стороне..........................' + self.REBSRlineEdit.text() + '\n')
        f.write('   Число Нуссельта:\n    по холодной стороне.........................................' + self.NusseltColdThermoforlineEdit.text() + '\n')
        f.write('    по горячей стороне..........................................' + self.NusseltHotThermoforlineEdit.text() + '\n')
        f.write('   Критерий Прандтля:\n    по холодной стороне.........................................' + self.PrandtlColdThermoforlineEdit.text() + '\n')
        f.write('    по горячей стороне..........................................' + self.PrandtlHotThermoforlineEdit.text() + '\n')
        f.close()
        return