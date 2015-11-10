from PyQt4 import QtCore,QtGui
from PyQt4.QtGui import *
import sys

class Score(QWidget):
	def __init__(self):
		super(Score,self).__init__()
		self.lab=QLabel("Hello,Label")
		self.main=QGraphicsWidget()
		self.main.addItem(self.lab) 




if __name__=='__main__':
	app=QApplication(sys.argv) 
	score=Score()
	score.show()
	sys.exit(app.exec_())