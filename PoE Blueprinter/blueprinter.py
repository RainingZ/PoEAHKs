import time
import pyautogui as ag
import pyscreenshot as ss
from itertools import combinations

BlueprintCount=7
imgLocation="C:\\Users\\Administrator\\Desktop\\PoE Blueprinter\\"

CellWith=53
InventoryX=1297
InventoryY=616
StashX=41
StashY=188
TradeX=338
TradeY=544
TradeGetX=338
TradeGetY=214
ScreenshotX=361
ScreenshotY=371
ScreenshotWidth=53*15
ScreenshotHeight=53*2

def mouseToInvSlot(n):
    x = InventoryX + (n // 5) * CellWith
    y = InventoryY + (n % 5) * CellWith
    ag.moveTo(x, y)

def mouseToTradeSlot(n):
    x = TradeX + (n // 5) * CellWith
    y = TradeY + (n % 5) * CellWith
    ag.moveTo(x, y)

def screenshot(name):
    im=ss.grab((ScreenshotX,ScreenshotY,ScreenshotX+ScreenshotWidth,ScreenshotY+ScreenshotHeight))
    im.save(imgLocation + str(name) + r'.png')

def controlClick():
    ag.keyDown('ctrl')
    ag.click()
    ag.keyUp('ctrl')

comb = combinations(range(BlueprintCount), 5)
count = 0
for i in list(comb): 
    name = ''
    for n in i:
        name = name + '_' + str(n)
        mouseToInvSlot(n)
        controlClick()
    ag.moveTo(TradeGetX,TradeGetY)
    ag.keyDown('alt')
    screenshot(name)
    ag.keyUp('alt')
    for j in range(5):
        mouseToTradeSlot(j)
        ag.click()
    count += 1
