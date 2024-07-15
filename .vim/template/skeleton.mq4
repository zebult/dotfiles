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

double PrevAccountBalance = 0;
int WinCount = 0;
int LoseCount = 0;

// TradeTicketNumber = OrderSend(Symbol(), OP_BUY, 1, Ask, 1, 0, 0, "order", 777, 0, Green);
// OrderClose(TradeTicketNumber, 1, Bid, 1, Green);
// TradeTicketNumber = OrderSend(Symbol(), OP_SELL, 1, Bid, 1, 0, 0, "order", 777, 0, Green);
// OrderClose(TradeTicketNumber, 1, Ask, 1, Green);

int OnInit()
{
    PrevAccountBalance = AccountBalance();

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

    UpdateWinLog();
}

void OnNewBar()
{
}

void UpdateWinLog()
{
    double rate = 0;
    if(WinCount != 0 && LoseCount != 0)
    {
        rate = NormalizeDouble((double)WinCount / (double)(WinCount + LoseCount), 2);
    }

    double currentAccountBalance = AccountBalance();

    if(PrevAccountBalance < currentAccountBalance)
    {
        WinCount += 1;
    }
    else if(PrevAccountBalance > currentAccountBalance)
    {
        LoseCount += 1;
    }

    PrevAccountBalance = currentAccountBalance;

    Comment(AccountBalance() + "| win " + WinCount + " | lose " + LoseCount + " | rate " + rate + " | lot " + Lot);
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
