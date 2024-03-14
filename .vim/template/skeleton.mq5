//+---------------------------'---------------------------------------+
//|                                                           saichi |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "saichi"
#property link      "https://unoun.co.jp/"
#property version   "1.00"
#property strict

int TradeTicketNumber = -1;
datetime BarTime;

// TradeTicketNumber = OrderSend(Symbol(), OP_BUY, 1, Ask, 1, 0, 0, "order", 777, 0, Green);
// OrderClose(TradeTicketNumber, 1, Bid, 1, Green);
// TradeTicketNumber = OrderSend(Symbol(), OP_SELL, 1, Bid, 1, 0, 0, "order", 777, 0, Green);
// OrderClose(TradeTicketNumber, 1, Ask, 1, Green);

int OnInit()
{
    return(INIT_SUCCEEDED);
}

void OnTick()
{
    // バーイベント
    {
        datetime currentTime = Time[0];
        if (currentTime != BarTime)
        {
            BarTime = currentTime;
            OnNewBar();
        }
    }
}

void OnNewBar()
{
}

void ViewLog(string log)
{
    int count = 0;
    while (true)
    {
        string objectName = "LOG_" + TimeToStr(Time[0]) + "_" + count;
        Print("objectName: ", objectName);
        Print("ObjectFind(objectName): ", ObjectFind(objectName));
        if(ObjectFind(objectName) != -1)
        {
            count += 1;
            continue;
        }

        ObjectCreate(objectName, OBJ_TEXT, 0, Time[0], (Close[0] + (0.0003 * count)));
        ObjectSetText(objectName, log, 10, "Verdana", Magenta);

        break;
    }
}
