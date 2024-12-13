//+---------------------------'---------------------------------------+
//|                                                           saichi |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "saichi"
#property link      "https://unoun.co.jp/"
#property version   "1.00"
#property strict

#include <Common/Common.mqh>

double MaxLotParam = 0;
double LotFactorParam = 0.6;

// TradeTicketNumber = OrderSend(Symbol(), OP_BUY, 1, Ask, 1, 0, 0, "order", 777, 0, Green);
// OrderClose(TradeTicketNumber, 1, Bid, 1, Green);
// TradeTicketNumber = OrderSend(Symbol(), OP_SELL, 1, Bid, 1, 0, 0, "order", 777, 0, Green);
// OrderClose(TradeTicketNumber, 1, Ask, 1, Green);

// Common::UpdateLot();
// Common::OrderSend(OP_BUY, Ask, 0, 0);
// Common::OrderClose(Bid);

int OnInit()
{
    // IsPRD = true;
    // IsAuthSkip = false;

    Common::Init();
    Common::SetMaxLot(MaxLotParam);
    Common::SetLotFactor(LotFactorParam);

    return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
    Common::DeInit();
}

void OnTick()
{
    if(IsPRD && !IsAllowAuth)
    {
        return;
    }

    Common::UpdateWinLog();

    if(Common::IsNewBar())
    {
        OnNewBar();
    }

    Exe();

    Common::Tick();
}

void OnNewBar()
{
    Common::NewBar();
}

void Exe()
{
}
