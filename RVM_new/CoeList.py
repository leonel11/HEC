class CoeList:

    def __init__(self):
        self.__coelist = []

    def __getitem__(self, i):
        return self.__coelist[i]

    def setCoeList(self, coelst):
        self.__coelist = coelst

    def __calcCoe(self, tb, tbsr, tg):
        res = (tb - tbsr) / (tb - tg) * 100.0
        return res

    def __calcGasGasCoe(self, w, wmin, tb, tbsr, tg):
        res = w / wmin * (tb - tbsr) / (tb - tg) * 100.0
        return res

    def addCoeInList(self, tb, tbsr, tg):
        self.__pushCoeToCoeList(self.__calcCoe(tb, tbsr, tg))

    def addGagGasCoeInList(self, w, wmin, tb, tbsr, tg):
        self.__pushCoeToCoeList(self.__calcGasGasCoe(w, wmin, tb, tbsr, tg))

    def getCoeListInStr(self):
        res = " | ".join("%2.2f" % x for x in self.__coelist)
        return res

    def getCoeListForReport(self):
        lst = []
        for x in self.__coelist:
            lst.append(x)
        if (len(lst) == 1):
            strcoe = '%2.2f' % lst[0]
            res = '   Общий КПД.......................................(%)          ' + strcoe + '\n'
        if (len(lst) == 2):
            str1 = '%2.2f' % lst[0]
            str2 = '%2.2f' % lst[1]
            res = '   Общий КПД:\n' + '    для первого прохода............................(%)          ' + str1 + '\n' + \
                  '    для второго прохода............................(%)          ' + str2 + '\n'
        return res

    def __pushCoeToCoeList(self, coe):
        self.__coelist.append(coe)