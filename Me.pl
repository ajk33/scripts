#!/usr/bin/perl
#

$/="\r\n";
&clear();
$total=0;

while (<DATA>) {
	chomp;
	if (m#^D(\d+)/(\d+)'(\d+)#) { 
		$mon = $1;
		$day = $2;
		$year = $3;
	}
	if (m#^T(.*)#) {  # ' for syntax highlighting
		$amt = $1;
		$amt =~ s/,//g;  # Remove comma
		$total += $amt;
	}
	if (/^L\[.*\]/) {  # ' for syntax highlighting
		$pmt="P";
	}
	if (m#\^#)  {
		if ($amt > 0) {
			print "$year/$mon/$day,${amt},,$total,$pmt\n";
		} else {
			print "$year/$mon/$day,,${amt},$total,$pmt\n";
		}
		&clear();
	}
}

sub clear {
	$amt = 0;
	$mon = 0;
	$day = 0;
	$year = 0;
	$pmt="C";
}
__DATA__
!Type:CCard
D1/28'2005
T-1,144.77
CX
POpening Balance
L[Discover Card Credit Card]
^
D1/28'2005
T-53.00
PTony Roma's Kihei,  HI
LFood:Dining Out
^
D1/28'2005
T-110.30
PHonolulu Airport Hotel
LVacation:Lodging
^
D1/29'2005
T-36.61
PKMart - Kahului HI
^
D1/30'2005
T-35.63
PKMart - Kahului HI
^
D1/30'2005
T-64.00
POutback Steakhouse - Kehei
LFood:Dining Out
^
D1/31'2005
T12.56
PKMart - Kahului HI
^
D1/31'2005
T12.56
PKMart - Kahului HI
^
D1/31'2005
T-89.93
PHertz - Kahuluhi HI
LAutomobile:Maintenance
^
D1/31'2005
T-18.75
PDAIRY ROAD EXPRESS MAR KAHULUI H
^
D1/31'2005
T-361.14
PMaui Hill Resort
^
D2/1'2005
T-22.00
PDennys - kehei
^
D2/1'2005
T-30.35
PComcast
^
D2/2'2005
T-32.49
PTARGET 1266 WOBURN MA
^
D2/5'2005
T-33.70
PRuby Tuesday
^
D2/5'2005
T-35.49
PMarket Basket
LFood:Groceries
^
D2/5'2005
T-36.33
PStop & Shop
^
D2/6'2005
T-24.50
PStop & Shop
LAutomobile:Gasoline
^
D2/12'2005
T-24.00
PStop & Shop
LAutomobile:Gasoline
^
D2/14'2005
T-32.97
PJiffy Lube - Billerica
LAutomobile:Maintenance
^
D2/14'2005
T-37.85
PVerizon Wireless
LBills:Cell Phone
^
D2/15'2005
T1,034.47
PINTERNET PAYMENT - THANK YOU
^
D2/17'2005
T-7.60
PShell - Bedford
LAutomobile:Gasoline
^
D2/19'2005
T-30.00
PStop & Shop
LAutomobile:Gasoline
^
D2/19'2005
T-21.02
PStop & Shop
LFood:Groceries
^
D2/21'2005
T-57.69
PStaples
LHouse:Furniture
^
D2/22'2005
T-15.68
PHome Depot
LHome Improvement:Tools
^
D2/26'2005
T-30.35
PHaffners
LAutomobile:Gasoline
^
D2/26'2005
M026989
T-30.35
PComcast
LBills:Cable Modem
^
D3/1'2005
MSnowthrower
T-1,049.99
PO'Connor True Value
LHouse:Yard Equipment
^
D3/3'2005
T-22.75
PStop & Shop
LAutomobile:Gasoline
^
D3/8'2005
T-42.95
PCatholic Answers
LEducation:Religious
SEducation:Religious
$-17.95
SCharitable Donation
$-25.00
^
D3/8'2005
T-30.00
PHaffners
LAutomobile:Gasoline
^
D3/9'2005
T-43.36
PMarket Basket
LFood:Groceries
^
D3/10'2005
T-28.99
POmaha Steaks
LFood:Groceries
^
D3/11'2005
MWireless Router
T-73.49
PCompUSA
LMiscellaneous:Computer
^
D3/14'2005
T1,164.22
PINTERNET PAYMENT - THANK YOU
^
D3/14'2005
M014827
T-37.78
PVerizon Wireless
LBills:Cell Phone
^
D3/17'2005
T-8.24
PExxon Mobil - Lexington
LAutomobile:Gasoline
^
D3/19'2005
MWaterfall
T-16.79
PBed Bath & Beyond
^
D3/19'2005
T-39.58
PHaffners
LAutomobile:Gasoline
^
D3/24'2005
MStephen - Video Game
T-39.99
PAmazon.com
LGifts:Birthday
^
D3/24'2005
T-34.00
PHaffners
LAutomobile:Gasoline
^
D3/25'2005
T-30.35
PComcast
LBills:Cable Modem
^
D3/26'2005
T-18.35
PTarget
LMiscellaneous:Cell Phone Acc.
^
D3/31'2005
MWet/Dry Vac - Extension Cord
T-70.29
PHome Depot
LHouse:Tools
^
D4/2'2005
T-38.44
PHaffners
LAutomobile:Gasoline
^
D4/2'2005
T7.86
PTarget
LMiscellaneous:Cell Phone Acc.
^
D4/2'2005
MNew Headset
T-18.89
PTarget
LMiscellaneous:Cell Phone Acc.
^
D4/4'2005
T-116.00
PTicketmaster
^
D4/7'2005
T-20.00
PHaffners
LAutomobile:Gasoline
^
D4/7'2005
T-53.78
PMarket Basket
LFood:Groceries
^
D4/10'2005
T1,522.00
PINTERNET PAYMENT - THANK YOU
L[Citizens Bank Checking]
^
D4/10'2005
T-40.00
PIHOP
LFood:Dining Out
SFood:Dining Out
$-19.70
^
D4/11'2005
M012644
T-37.80
PVerizon Wireless
LBills:Cell Phone
^
D4/12'2005
T-21.65
PMarket Basket
LFood:Groceries
^
D4/13'2005
T-25.00
PHaffners
LAutomobile:Gasoline
^
D4/19'2005
T-1,784.98
PSelect Comfort
LHouse:Furniture
^
D4/19'2005
T-37.78
PStop & Shop
LAutomobile:Gasoline
^
D4/22'2005
T-32.00
PPizzaria Uno
LFood:Dining Out
^
D4/25'2005
T-35.00
PHaffners
LAutomobile:Gasoline
^
D4/25'2005
M025271
T-30.35
PComcast
LBills:Cable Modem
^
D4/30'2005
T-20.25
POffice Max
LMiscellaneous
^
D5/3'2005
T-58.01
PMarket Basket
LFood:Groceries
^
D5/3'2005
T-36.00
PHaffners
LAutomobile:Gasoline
^
D5/6'2005
MBrakes
T-279.80
PHerb Chambers Honda
LAutomobile:Maintenance
^
D5/6'2005
M3FAD7719CD73
T621.29
L[Citizens Bank Checking]
^
D5/6'2005
T-19.96
PStop & Shop
LFood:Groceries
^
D5/7'2005
T-11.53
PTarget
LMiscellaneous
^
D5/9'2005
T-36.00
PBertuccis
LFood:Dining Out
^
D5/10'2005
T7.34
PTarget
LMiscellaneous:Cell Phone Acc.
^
D5/11'2005
T-8.75
PShaws
LFood:Groceries
^
D5/12'2005
T-34.00
PHaffners
LAutomobile:Gasoline
^
D5/12'2005
MTires
T-307.98
PBJs Wholesale
LAutomobile:Maintenance
^
D5/15'2005
M015718
T-37.85
PVerizon Wireless
LBills:Cell Phone
^
D5/18'2005
T-30.00
PHess Express
LAutomobile:Gasoline
^
D5/18'2005
MMailbox + Shovel
T-48.23
PO'Connor True Value
LHouse:Yard Equipment
^
D5/20'2005
T-32.72
PAegean Restraunt
LFood:Dining Out
^
D5/24'2005
MGrass seed & Round-up
T-25.18
PO'Connor True Value
LHouse:Yard Equipment
^
D5/25'2005
M025387
T-30.35
PComcast
LBills:Cable Modem
^
D5/25'2005
T-32.75
PHess Express
LAutomobile:Gasoline
^
D5/26'2005
T-19.69
PCVS
LPersonal Care
^
D5/28'2005
MLights for Mom
T-25.20
PKMart
LGifts
^
D5/31'2005
T-23.57
PShaws
LFood:Groceries
^
D6/2'2005
T-33.00
PHess Express
LAutomobile:Gasoline
^
D6/4'2005
MHose, Sprayer, Insect Killer
T-43.02
PO'Connor True Value
LHouse:Yard Equipment
^
D6/4'2005
T-34.30
PMarket Basket
LFood:Groceries
^
D6/5'2005
T-21.10
POlive Garden
LFood:Dining Out
^
D6/7'2005
T-50.00
PCatholic Answers
LCharitable Donation
^
D6/9'2005
T-68.61
PPampered Chef
LHouse:Kitchen Stuff
^
D6/10'2005
T-5.00
PShell - Lexington
LAutomobile:Gasoline
^
D6/10'2005
T-29.00
PHess Express
LAutomobile:Gasoline
^
D6/11'2005
M1B4C5526D173
T2,725.05
L[Citizens Bank Checking]
^
D6/13'2005
T-37.85
PVerizon Wireless
LBills:Cell Phone
^
D6/17'2005
T-31.00
PHess Express
LAutomobile:Gasoline
^
D6/19'2005
T-31.81
P99 Restaurant
LFood:Dining Out
^
D6/20'2005
T-66.50
PFocaccia
LFood:Dining Out
^
D6/20'2005
T-66.00
PDept of Conserv. - Augusta ME
^
D6/23'2005
M023406
T-56.46
PComcast
LBills:Cable Modem
^
D6/24'2005
T-36.75
PHess Express
LAutomobile:Gasoline
^
D6/25'2005
T-19.95
PRoche Brothers
LFood:Groceries
^
D6/25'2005
T-30.97
PMarket Basket
LFood:Groceries
^
D6/29'2005
T-35.00
PHaffners
LAutomobile:Gasoline
^
D7/1'2005
T-39.87
POffice Max
LMiscellaneous
^
D7/1'2005
T-39.18
PAmazon.com
LEducation:Religious
^
D7/4'2005
T-22.50
PCumberland Farms - Woolrich ME
LAutomobile:Gasoline
^
D7/4'2005
T-199.00
PSunrocket
^
D7/8'2005
T-35.25
PHess Express
LAutomobile:Gasoline
^
D7/8'2005
M00037BB09473
T826.42
L[Citizens Bank Checking]
^
D7/9'2005
MBookcase
T-48.36
PStaples
LHouse:Furniture
^
D7/16'2005
M016537
T-37.89
PVerizon Wireless
LBills:Cell Phone
^
D7/16'2005
T-34.75
PHaffners
LAutomobile:Gasoline
^
D7/16'2005
MHose, Sprayer, Insect Killer
T-41.43
PO'Connor True Value
LHouse:Yard Equipment
^
D7/16'2005
T-29.35
PMarket Basket
LFood:Groceries
^
D7/16'2005
T-14.46
PShaws
LFood:Groceries
^
D7/18'2005
MFans
T-18.88
PO'Connor True Value
LHouse
^
D7/20'2005
T-26.37
PStop & Shop
LFood:Groceries
SFood:Groceries
$-17.99
^
D7/20'2005
T-267.61
L[Citizens Bank Checking]
^
D7/22'2005
T-35.00
PHess Express
LAutomobile:Gasoline
^
D7/25'2005
M023080
T-56.46
PComcast
LBills:Cable Modem
^
D7/29'2005
T-34.00
PHess Express
LAutomobile:Gasoline
^
D7/30'2005
T-17.32
PMarket Basket
LFood:Groceries
^
D8/6'2005
T-36.00
PCarli Convenience
LAutomobile:Gasoline
^
D8/6'2005
MHomiletic & Pastoral Review
T-26.00
PIgnatius Press
LBills:Magazine
^
D8/7'2005
M51DE0E09305B
T827.21
L[Citizens Bank Checking]
^
D8/12'2005
T-36.00
PHess Express
LAutomobile:Gasoline
^
D8/13'2005
T-42.99
PO'Connor True Value
LHouse
^
D8/13'2005
T-2.00
PLogan Airport Parking
^
D8/15'2005
M015323
T-37.74
PVerizon Wireless
LBills:Cell Phone
^
D8/18'2005
T-37.00
PCarli Convenience
LAutomobile:Gasoline
^
D8/19'2005
T-37.48
PStop & Shop
LFood:Candy
SFood:Candy
$-15.47
SFood:Groceries
$-16.76
^
D8/22'2005
M11226753
T-56.46
PComcast
LBills:Cable Modem
^
D8/23'2005
T-39.00
PCarli Convenience
LAutomobile:Gasoline
^
D8/25'2005
T-144.43
PAmazon.com
^
D8/26'2005
T-10.36
PAmazon.com
LEducation:Religious
^
D9/1'2005
T-43.50
PCarli Convenience
LAutomobile:Gasoline
^
D9/2'2005
T-35.32
PMarket Basket
LFood:Groceries
^
D9/2'2005
T-26.70
PStop & Shop
LFood:Groceries
^
D9/3'2005
T-34.80
PGarrison's Restaurant
LFood:Dining Out
^
D9/5'2005
T-60.43
PBuilding 19 1/2
LHouse:Kitchen Stuff
SHouse:Kitchen Stuff
EFood Processor
$-39.99
SHouse:Lightbulbs
$-6.92
SHouse:Storage
EShelf Savers
$-9.98
^
D9/5'2005
T-38.79
PKMart
LHouse:Bathroom Stuff
^
D9/10'2005
M010244
T-38.38
PVerizon Wireless
LBills:Cell Phone
^
D9/11'2005
M24649DA3945B
T462.90
L[Citizens Bank Checking]
^
D9/12'2005
T-50.00
PCarli Convenience
LAutomobile:Gasoline
^
D9/19'2005
T-47.00
PCarli Convenience
LAutomobile:Gasoline
^
D9/21'2005
M11783952
T-56.46
PComcast
LBills:Cable Modem
^
D9/23'2005
T-22.25
PHess Express
LAutomobile:Gasoline
^
D9/24'2005
T-67.00
PPatrick Madrid
LEducation:Religious
^
D10/1'2005
MJennifer & I
T-27.50
PVinny T's
LFood:Dining Out
^
D10/2'2005
Mwhxp8326
T-123.90
PCatholic Answers
LCharitable Donation
SCharitable Donation
$-100.00
SEducation:Religious
$-23.90
^
D10/2'2005
T-6.78
PAmazon.com
LEducation:Religious
^
D10/3'2005
T-6.00
PHeritage Service
LAutomobile:Gasoline
^
D10/4'2005
T-42.00
PCarli Convenience
LAutomobile:Gasoline
^
D10/4'2005
T-33.95
PAmazon.com
LEducation:Religious
^
D10/8'2005
M1234129FF75B
T716.39
L[Citizens Bank Checking]
^
D10/8'2005
T-74.00
PMarket Basket
LFood:Groceries
^
D10/13'2005
T-30.05
PStop & Shop
LFood:Groceries
^
D10/13'2005
T-39.00
PMobil
LAutomobile:Gasoline
^
D10/13'2005
M014382
T-37.79
PVerizon Wireless
LBills:Cell Phone
^
D10/17'2005
T-9.95
PAmazon.com
LEducation:Religious
^
D10/17'2005
T-34.06
PAmazon.com
LEducation:Religious
SEducation:Religious
$-10.36
SGifts:Birthday
$-23.70
^
D10/20'2005
T-39.00
PCarli Convenience
LAutomobile:Gasoline
^
D10/22'2005
T-25.89
PRuby Tuesday
LFood:Dining Out
^
D10/23'2005
T-21.33
PAmazon.com
LEducation:Religious
SEducation:Religious
$-10.17
SGifts:Birthday
$-11.16
^
D10/25'2005
MPipe Insulation
T-17.58
PO'Connor True Value
LHouse
^
D10/29'2005
T-48.00
PCarli Convenience
LAutomobile:Gasoline
^
D11/5'2005
T-32.29
PBickfords Grill
LFood:Dining Out
^
D11/5'2005
T-0.20
PAmazon.com
LEducation:Religious
^
D11/5'2005
T-0.35
PAmazon.com
LEducation:Religious
^
D11/8'2005
T-45.00
PCarli Convenience
LAutomobile:Gasoline
^
D11/9'2005
T-9.99
PDISCOVER PROFILEPRTECT 877-623-8
^
D11/9'2005
MPipe Insulation
T-25.18
PO'Connor True Value
LHouse
^
D11/9'2005
T-20.10
PRoche Brothers
LFood:Groceries
^
D11/10'2005
M2D7CD43EB443
T613.68
L[Citizens Bank Checking]
^
D11/11'2005
T-31.15
PWright Seafood Restaraunt
LFood:Dining Out
^
D11/12'2005
T-209.99
PCBD
LEducation:Religious
^
D11/13'2005
M014048
T-38.10
PVerizon Wireless
LBills:Cell Phone
^
D11/16'2005
T-38.50
PFocaccia
LFood:Dining Out
^
D11/16'2005
T-30.00
PHess Express
LAutomobile:Gasoline
^
D11/18'2005
MThe Catholic Answer
T-20.95
POur Sunday Visitor
LEducation:Religious
^
D11/23'2005
T-10.10
PCitgo- Madison AL
^
D11/24'2005
T-257.24
PMarriott - Huntsville
^
D11/24'2005
T-72.00
PLogan Airport Parking
^
D11/25'2005
M021264
T-56.46
PComcast
LBills:Cable Modem
^
D11/28'2005
T-30.00
PHess Express
LAutomobile:Gasoline
^
D12/5'2005
T-25.00
PDennys - Lexington
LFood:Dining Out
^
D12/6'2005
T-30.00
PHess Express
LAutomobile:Gasoline
^
D12/6'2005
T-41.46
PMarket Basket
LFood:Groceries
^
D12/7'2005
T9.99
PDISCOVER PROFILEPRTECT 877-623-8
^
D12/10'2005
MSneakers
T-39.99
PBob's Stores - Billerica
LClothing:Footware
^
D12/10'2005
T-41.75
PMarket Basket
LFood:Groceries
^
D12/10'2005
T-27.50
PRuby Tuesday
LFood:Dining Out
^
D12/11'2005
M2D7CE6205743
T608.16
L[Citizens Bank Checking]
^
D12/12'2005
T-419.01
PChapman Fuel
LBills:Heat
^
D12/12'2005
M012170
T-38.10
PVerizon Wireless
LBills:Cell Phone
^
D12/14'2005
T-32.20
PLexington Gulf
LAutomobile:Gasoline
^
D12/17'2005
MTransaction ID:  13629112
T-56.46
PComcast
LBills:Cable Modem
^
D12/20'2005
T-33.00
PCarli Convenience
LAutomobile:Gasoline
^
D12/20'2005
T-23.95
PCensus PC
^
D12/21'2005
T-25.00
PBJs Wholesale
LMiscellaneous:Club Membership
^
D12/23'2005
T-50.00
PNorthwoods Brewpub
LGifts:Christmas
^
D12/27'2005
T-20.50
PShell - Des Plaines IL
LAutomobile:Gasoline
^
D12/28'2005
T-100.00
PThomas More Law Center
LCharitable Donation
^
D12/28'2005
Mvhyg2308
T-112.60
PCatholic Answers
LCharitable Donation
SCharitable Donation
$-100.00
SEducation:Religious
$-12.60
^
D12/28'2005
T-100.00
PEWTN
LCharitable Donation
^
D12/28'2005
T-42.97
PTarget
LGifts:Christmas
SGifts:Christmas
ERollerBlades
$-39.99
SGifts:Card
ECards
$-1.49
SGifts:Gift Wrap
EWrap
$-1.49
^
D1/2'2006
T-31.00
PCarli Convenience
LAutomobile:Gasoline
^
D1/6'2006
M2D7CCE48C78B
T1,200.27
L[Citizens Bank Checking]
^
D1/6'2006
M005006
T-38.10
PVerizon Wireless
LBills:Cell Phone
^
D1/10'2006
T-35.00
PHess Express
LAutomobile:Gasoline
^
D1/16'2006
T-31.00
PHess Express
LAutomobile:Gasoline
^
D1/16'2006
M14326813
T-56.46
PComcast
LBills:Cable Modem
^
D1/18'2006
T-139.27
PHonolulu Airport Hotel
^
D1/22'2006
T-384.46
PChapman Fuel
LBills:Heat
^
D1/24'2006
T-212.96
PMidwest Theological Forum
^
D1/27'2006
T-139.27
PHonolulu Airport Hotel
^
D2/4'2006
T-924.00
PAnais Jewlery
LGifts:Rings
^
D2/5'2006
T-34.00
PShell
LAutomobile:Gasoline
^
D2/5'2006
T-25.71
PAmazon.com
LEducation:Religious
SEducation:Religious
$-20.72
^
D2/11'2006
T-27.00
PGulf
LAutomobile:Gasoline
^
D2/11'2006
M4HX80WLZYD0M
T668.58
L[Citizens Bank Checking]
^
D2/11'2006
M011730
T-38.16
PVerizon Wireless
LBills:Cell Phone
^
D2/18'2006
MTransaction ID:  15182441
T-57.12
PComcast
LBills:Cable Modem
^
D2/18'2006
T-31.00
PSupreme Gas
LAutomobile:Gasoline
^
D2/18'2006
T-77.68
POffice Max
LMiscellaneous
^
D2/20'2006
T-15.00
PHaffners
LAutomobile:Gasoline
^
D2/20'2006
T-36.69
PAmazon.com
LEducation:Religious
^
D2/24'2006
T-23.11
PCountry Kitchen - Eau Claire
LFood:Dining Out
^
D3/4'2006
T-29.00
PHess Express
LAutomobile:Gasoline
^
D3/7'2006
T-414.92
PChapman Fuel
LBills:Heat
^
D3/7'2006
T-39.10
PMarket Basket
LFood:Groceries
^
D3/9'2006
M$2.189/gal
T-31.00
PHess Express
LAutomobile:Gasoline
^
D3/11'2006
M6ZZ46Z8N4N7D
T2,012.29
L[Citizens Bank Checking]
^
D3/11'2006
M011006
T-38.16
PVerizon Wireless
LBills:Cell Phone
^
D3/11'2006
T-23.46
PO'Connor True Value
LHouse
SHouse
EPipe Insulation
$-5.86
SHouse:Kitchen Stuff
EMason Jars
$-19.93
S
ESteaks for fence
$-2.92
S
ECoupon
$5.25
S
$0.00
^
D3/16'2006
M$2.359/gal
T-10.00
PSupreme Gas
LAutomobile:Gasoline
^
D3/17'2006
M$2.319/gal
T-29.00
PHess Express
LAutomobile:Gasoline
^
D3/22'2006
T-22.75
PSubco Amoco - Orlando
^
D3/22'2006
T-77.00
PLogan Airport Parking
^
D3/22'2006
T-326.34
PHoliday Inn Cocoa Beach
^
D3/23'2006
T-25.00
PMario's Restaurant
LFood:Dining Out
^
D3/24'2006
M16093482
T-57.12
PComcast
LBills:Cable Modem
^
D3/25'2006
T-83.99
PBed Bath & Beyond
LGifts:Wedding
^
D3/25'2006
T-40.00
PChili's
LFood:Dining Out
^
D3/28'2006
M$2.359/gal
T-37.00
PSupreme Gas
LAutomobile:Gasoline
^
D3/30'2006
T-220.00
PChanticleer Guest House WI
LVacation:Lodging
^
D4/1'2006
T-41.00
PRegistry of Motor Vehicles
LAutomobile:Registration
^
D4/1'2006
Mcrln7453
T-100.00
PCatholic Answers
LCharitable Donation
^
D4/1'2006
MVirtual Credit Card
T-100.00
PThomas More Law Center
LCharitable Donation
^
D4/4'2006
M$2.469/gal
T-37.25
PHess Express
LAutomobile:Gasoline
^
D4/8'2006
M008618
T-38.16
PVerizon Wireless
LBills:Cell Phone
^
D4/8'2006
MBBB2092683211
T-145.24
PBed Bath & Beyond
LGifts:Wedding
^
D4/8'2006
CX
T-32.65
PAmazon.com
LEducation:Religious
^
D4/11'2006
M3ZHB6CVW69G4
T816.24
L[Citizens Bank Checking]
^
D4/12'2006
T-10.01
PHess Express
LAutomobile:Gasoline
^
D4/15'2006
M$2.699/gal
T-42.00
PHess Express
LAutomobile:Gasoline
^
D4/21'2006
MWJG49FJ
T-8.26
PSears
LHouse:Tools
^
D4/22'2006
T-29.11
PMarket Basket
LFood:Groceries
^
D4/24'2006
M$2.849/gal
T-47.25
PHess Express
LAutomobile:Gasoline
^
D4/25'2006
M16860699
T-57.12
PComcast
LBills:Cable Modem
^
D4/27'2006
T-84.99
PMen's Warehouse
LClothing
^
D5/1'2006
T-50.00
PCarli Convenience
LAutomobile:Gasoline
^
D5/5'2006
MCNP4ZLQQN4HM
T1,432.51
L[Citizens Bank Checking]
^
D5/10'2006
T-50.00
PCarli Convenience
LAutomobile:Gasoline
^
D5/13'2006
M013547
T-38.19
PVerizon Wireless
LBills:Cell Phone
^
D5/13'2006
T-36.91
P99 Restaurant
LFood:Dining Out
^
D5/16'2006
T-52.00
PCarli Convenience
LAutomobile:Gasoline
^
D5/18'2006
T-23.58
PO'Connor True Value
LHome Improvement
^
D5/23'2006
M023754 Transaction ID:  17738248
T-57.12
PComcast
LBills:Cable Modem
^
D5/25'2006
T-26.22
PVerizon Wireless
LMiscellaneous:Cell Phone Acc.
^
D5/29'2006
T12.78
PAmericinn Long Lake
^
D5/29'2006
T-161.66
PAmericinn Long Lake
^
D6/2'2006
T-199.00
PSunrocket
LBills:Phone
^
D6/3'2006
T-43.00
PCumberland Farms
LAutomobile:Gasoline
^
D6/10'2006
M4G6Z7BRV260V
T443.83
L[Citizens Bank Checking]
^
D6/10'2006
M010614
T-38.31
PVerizon Wireless
LBills:Cell Phone
^
D6/10'2006
T-42.00
PSupreme Gas
LAutomobile:Gasoline
^
D6/17'2006
T-32.00
PCumberland Farms
LAutomobile:Gasoline
^
D6/17'2006
T-29.50
PApplebees
LFood:Dining Out
^
D6/23'2006
M18565066
T-57.12
PComcast
LBills:Cable Modem
^
D6/23'2006
Mlzlg7846
T-72.95
PCatholic Answers
LCharitable Donation
SCharitable Donation
Elzlg7846
$-50.00
SEducation:Religious
$-22.95
^
D6/24'2006
T-41.55
PMarket Basket
LFood:Groceries
^
D6/24'2006
T-29.14
PJiffy Lube - Billerica
LAutomobile:Maintenance
^
D6/30'2006
Mfilters
T-64.70
PHerb Chambers Honda
LAutomobile:Maintenance
^
D7/1'2006
T-30.41
PBed Bath & Beyond
LGifts:Wedding
^
D7/1'2006
T-46.25
PCumberland Farms
LAutomobile:Gasoline
^
D7/5'2006
T-21.50
PCourtyard By Marriott Cocoa Beac
^
D7/8'2006
T-529.47
PHampton Inn Cocoa Beach, FL
^
D7/8'2006
T-44.51
POffice Depot
LMiscellaneous:Office Supplies
^
D7/8'2006
T-30.76
PSubco Amoco - Orlando
^
D7/8'2006
T-88.00
PLogan Airport Parking
^
D7/12'2006
M6L19Q7MG240X
T630.11
L[Citizens Bank Checking]
^
D7/13'2006
C*
M013957
T-37.25
PVerizon Wireless
LBills:Cell Phone
^
D7/13'2006
T-23.01
PSubco Amoco - Orlando
^
D7/13'2006
T-462.87
PHampton Inn Cocoa Beach, FL
^
D7/13'2006
T-88.00
PLogan Airport Parking
^
D7/13'2006
T-31.00
P99 Restaurant
LFood:Dining Out
^
D7/15'2006
T-50.00
PCumberland Farms
LAutomobile:Gasoline
^
D7/15'2006
T-54.51
PRoche Brothers
LFood:Groceries
^
D7/15'2006
T-7.67
PShaws
LFood:Groceries
^
D7/18'2006
MHomiletic & Pastoral Review
T-48.00
PIgnatius Press
LBills:Magazine
^
D7/18'2006
T-60.77
PCheesecake Factory
LFood:Dining Out
^
D7/22'2006
T-45.00
PCarli Convenience
LAutomobile:Gasoline
^
D7/24'2006
MBedroom Furniture
T-517.40
PJC Penny
LHouse:Furniture
^
D7/25'2006
M19399667
T-57.12
PComcast
LBills:Cable Modem
^
D7/26'2006
T-25.50
PSubco Amoco - Orlando
^
D7/27'2006
T-326.34
PHoliday Inn Cocoa Beach
^
D7/27'2006
T-77.00
PLogan Airport Parking
^
D7/31'2006
T-46.25
PCumberland Farms
LAutomobile:Gasoline
^
D8/3'2006
M003582
T-37.21
PVerizon Wireless
^
D8/4'2006
MRemote Transmitter
T-43.47
PHerb Chambers Honda
LAutomobile:Maintenance
^
D8/7'2006
T-45.00
PCarli Convenience
LAutomobile:Gasoline
^
D8/10'2006
T-26.00
PConsumer Reports
LBills:Magazine
^
D8/11'2006
M8H4W41YH08P3
T1,814.50
L[Citizens Bank Checking]
^
D8/12'2006
T-49.97
PLowes
LHouse:Shelves
^
D8/12'2006
Mdhwn2533
T-250.00
PCatholic Answers
LCharitable Donation
^
D8/12'2006
T-471.37
PLowes
LHouse:Shelves
SHouse:Shelves
$-49.97
SHouse:Grill
$-199.00
SHouse:Grill
ECover
$-19.94
SHouse:Dehumidifer
$-189.00
S
EHose
$-4.98
SHouse:Garden
EPot
$-8.48
^
D8/12'2006
T-40.00
PCarli Convenience
LAutomobile:Gasoline
^
D8/12'2006
T-899.99
PSears
^
D8/17'2006
T200.00
PCash Back Bonus
^
D8/19'2006
T-60.83
PMarket Basket
LFood:Groceries
^
D8/19'2006
T-56.00
PCumberland Farms
LAutomobile:Gasoline
^
D8/22'2006
T-2.00
PLogan Airport Parking
^
D8/25'2006
M20194283
T-57.12
PComcast
LBills:Cable Modem
^
D8/26'2006
T-35.00
PApplebees
LFood:Dining Out
^
D8/28'2006
MGrill
T199.00
PLowes
LHouse:Grill
^
D8/28'2006
T-167.16
PLowes
LHouse:Grill
^
D8/28'2006
T-35.25
PCumberland Farms
LAutomobile:Gasoline
^
D9/1'2006
T-10.17
PAmazon.com
LEducation:Religious
^
D9/3'2006
CX
T-25.00
PAmazon.com
LEducation:Religious
^
D9/4'2006
M$2.619/gal
T-40.00
PCumberland Farms
LAutomobile:Gasoline
^
D9/7'2006
T-217.56
PHampton Inn Cocoa Beach, FL
^
D9/7'2006
T-24.81
PSubco Amoco - Orlando
^
D9/7'2006
T-66.00
PLogan Airport Parking
^
D9/11'2006
MBP08PJ58PWGQ
T2,626.06
L[Citizens Bank Checking]
^
D9/13'2006
M008742
T-37.21
PVerizon Wireless
LBills:Cell Phone
^
D9/14'2006
M$2.419/gal
T-45.00
PCumberland Farms
LAutomobile:Gasoline
^
D9/16'2006
M20883213
T-57.12
PComcast
LBills:Cable Modem
^
D9/16'2006
T-493.50
PAnais Jewlery
LGifts:Rings
^
D9/16'2006
T-645.44
PLowes
LHome Improvement:Bathroom
^
D9/16'2006
MMom's Van $2.399/gal
T-23.50
PCumberland Farms
LAutomobile:Gasoline
^
D9/18'2006
T-115.48
PJC Penny
LGifts:Wedding
^
D9/18'2006
T-56.69
POffice Max
LMiscellaneous:Printer Ink
^
D9/19'2006
T-676.75
PThe Granite Group
LHome Improvement:Bathroom
^
D9/20'2006
T-107.10
PLowes
LHome Improvement:Bathroom
^
D9/23'2006
T-27.47
PMarket Basket
LFood:Groceries
^
D9/23'2006
T-37.00
PHaffners
LAutomobile:Gasoline
^
D9/23'2006
MFlooring
T-186.73
PLowes
LHome Improvement:Bathroom
^
D9/23'2006
T-34.07
PCVS
LPersonal Care:Vitamins
^
D9/27'2006
T-44.31
PKohls
LClothing
^
D9/29'2006
MRehersal Dinner
T-291.19
PDraganetti's Ristorante
LWedding
^
D10/2'2006
T-17.00
PPackerland Shell
LAutomobile:Gasoline
^
D10/2'2006
T-615.56
PChanticleer Guest House WI
LVacation:Lodging
^
D10/2'2006
T-26.25
PMega Express
^
D10/6'2006
T-16.50
PMarathon Mart
LAutomobile:Gasoline
^
D10/6'2006
MSuitcase
T-158.24
PYounkers
^
D10/8'2006
M$2.259/gal
T-18.00
PBulk - Gas Station
LAutomobile:Gasoline
^
D10/9'2006
T-629.84
PHarbor House Inn
LVacation:Lodging
^
D10/10'2006
T-63.87
PNorthwoods Brewpub
LFood:Dining Out
^
D10/10'2006
MMary Kneer and Ann Kline
T-45.00
PDraganetti's Ristorante
LGifts
^
D10/11'2006
CX
MB04XBZH840G4
T933.11
L[Citizens Bank Checking]
^
D10/11'2006
T-135.00
POtter Creek Inn
LVacation:Lodging
^
D10/12'2006
M012171
T-37.21
PVerizon Wireless
LBills:Cell Phone
^
D10/14'2006
T-51.33
PO'Connor True Value
LHome Improvement
^
D10/17'2006
T-127.73
PLowes
LHome Improvement:Bathroom
^
D10/19'2006
M$2.099/gal
T-30.50
PHess Express
LAutomobile:Gasoline
^
D10/21'2006
T57.24
PLowes
LHome Improvement:Bathroom
^
D10/21'2006
T-88.95
PLowes
LHome Improvement:Bathroom
^
D10/21'2006
T-114.47
PO'Connor True Value
LHome Improvement
SHome Improvement
$-22.97
SHome Improvement:Bathroom
$-91.50
^
D10/21'2006
M021782
T-57.12
PComcast
LBills:Cable Modem
^
D10/23'2006
T-44.14
PO'Connor True Value
LHome Improvement:Bathroom
^
D10/24'2006
T-25.86
PHome Depot
LHome Improvement:Bathroom
^
D10/25'2006
MGift Card
T-50.00
P99 Restaurant
LFood:Dining Out
^
D10/25'2006
M$2.059/gal
T-31.00
PHess Express
LAutomobile:Gasoline
^
D10/27'2006
T-40.74
PMarket Basket
LFood:Groceries
^
D10/28'2006
MRental Truck $2.599/gal
T-6.50
PShell
LAutomobile:Gasoline
^
D10/29'2006
T-81.45
PPenske
LHouse:Moving
^
D11/3'2006
T-31.50
PShell
LAutomobile:Inspection
^
D11/11'2006
MC4LQBQ5RCD5L
T4,655.15
L[Citizens Bank Checking]
^
D11/13'2006
M013310
T-37.11
PVerizon Wireless
LBills:Cell Phone
^
D11/13'2006
T-67.95
PShavers.com
^
D11/15'2006
T-34.10
PCarli Convenience
LAutomobile:Gasoline
^
D11/17'2006
T-390.04
PChapman Fuel
LBills:Heat
^
D11/18'2006
T-43.32
PO'Connor True Value
LHome Improvement:Bathroom
^
D11/24'2006
T-20.13
PO'Connor True Value
LHome Improvement:Bathroom
^
D11/24'2006
T-78.45
PLowes
LHouse:Heating
^
D11/25'2006
MTracking # 22937905
T-57.12
PComcast
LBills:Cable Modem
^
D11/27'2006
T-32.00
PHess Express
LAutomobile:Gasoline
^
D11/28'2006
MFan Hood, Hinges, Magnet, Pitchfork
T-37.76
PO'Connor True Value
LHome Improvement
SHome Improvement
EFan Hood, Hinges, Magnet
$-6.27
SHome Improvement:Tools
EPitchfork
$-31.49
^
D12/6'2006
T-40.00
PBertuccis
LFood:Dining Out
^
D12/7'2006
T-35.00
PHess Express
LAutomobile:Gasoline
^
D12/9'2006
M009209
T-37.11
PVerizon Wireless
LBills:Cell Phone
^
D12/9'2006
T-43.54
PGarrison's Restaurant
LFood:Dining Out
^
D12/9'2006
T0.00
PSECURE NUMBER 6011401097708386
^
D12/10'2006
T-60.99
PJC Penny
LGifts:Christmas
^
D12/11'2006
MC4Z8WDZ88GD8
T777.78
L[Citizens Bank Checking]
^
D12/12'2006
T0.00
PSECURE NUMBER 6011400307423216
^
D12/15'2006
T-299.67
PHoliday Inn Cocoa Beach
^
D12/15'2006
T-14.70
PSubco Amoco - Orlando
^
D12/15'2006
T-88.00
PLogan Airport Parking
^
D12/17'2006
T-250.00
PThomas More Law Center
LCharitable Donation
^
D12/17'2006
T0.00
PSECURE NUMBER 6011400298861457
^
D12/18'2006
MChristopher - Air Hose
T-62.99
PSears
LGifts:Christmas
^
D12/18'2006
MLynette - Cardigan Sweater
T-18.00
PSears
LGifts:Christmas
^
D12/18'2006
T-54.98
PJC Penny
LGifts:Christmas
^
D12/18'2006
T0.00
PSECURE NUMBER 6011400307423216
^
D12/22'2006
T-50.00
PAmazon.com
LGifts:Christmas
^
D12/22'2006
T0.00
P47040975075552
^
D12/22'2006
T0.00
PSECURE NUMBER 6011400938137649
^
D12/23'2006
T-35.00
PCumberland Farms
LAutomobile:Gasoline
^
D12/23'2006
M23820295
T-57.12
PComcast
LBills:Cable Modem
^
D12/31'2006
MThe Catholic Answer
T-21.95
POur Sunday Visitor
LEducation:Religious
^
D1/1'2007
T-18.31
PShaws
LFood:Groceries
^
D1/4'2007
M$2.279/gal
T-32.00
PCumberland Farms
LAutomobile:Gasoline
^
D1/7'2007
T-69.01
PLowes
LHome Improvement:Bathroom
SHome Improvement:Bathroom
$-44.92
SHome Improvement:Tools
$-24.09
^
D1/9'2007
MBrakes (rear rotors)
T-866.20
PHerb Chambers Honda
LAutomobile:Maintenance
^
D1/11'2007
M011791
T-37.11
PVerizon Wireless
LBills:Cell Phone
^
D1/11'2007
T0.00
PSECURE NUMBER 6011401097708386
^
D1/12'2007
M20HRN5R5V8VC
T909.56
L[Citizens Bank Checking]
^
D1/15'2007
M$1.929/gal
T-18.41
PSuperAmerica
LAutomobile:Gasoline
^
D1/16'2007
MMSP
T-25.61
PChili's
LFood:Dining Out
^
D1/16'2007
T-368.79
PChapman Fuel
LBills:Heat
^
D1/17'2007
MMom
T-317.02
PChapman Fuel
LReimbursable:Mom
^
D1/18'2007
M$2.159/gal
T-35.00
PCumberland Farms
LAutomobile:Gasoline
^
D1/19'2007
T-44.43
PEmerald Rose
LFood:Dining Out
^
D1/20'2007
M24704102
T-57.12
PComcast
LBills:Cable Modem
^
D1/28'2007
M$2.059/gal
T-28.25
PPrime
LAutomobile:Gasoline
^
D1/29'2007
M$2.040/gal
T-43.00
PHess Express
LAutomobile:Gasoline
^
D1/29'2007
T-28.88
PAmazon.com
LEducation:Religious
^
D2/3'2007
T-79.94
PH&R Block Digital Tax Solutions
LComputer:Software
^
D2/8'2007
T-32.82
PBugaboo Creek
LFood:Dining Out
^
D2/8'2007
T-31.50
PCumberland Farms
LAutomobile:Gasoline
^
D2/9'2007
T-22.40
PCarli Convenience
LAutomobile:Gasoline
^
D2/11'2007
M47GZ47YHQ029
T1,975.04
L[Citizens Bank Checking]
^
D2/15'2007
M015922
T-37.11
PVerizon Wireless
LBills:Cell Phone
^
D2/15'2007
MJennifer's Final Bill
T-32.59
PVerizon Wireless
LBills:Cell Phone
^
D2/17'2007
T-30.97
PJiffy Lube - Billerica
LAutomobile:Maintenance
^
D2/17'2007
T-10.00
PHaffners
LAutomobile:Gasoline
^
D2/17'2007
T-30.88
PJiffy Lube - Billerica
LAutomobile:Maintenance
^
D2/17'2007
T-10.30
PPost Office
LMiscellaneous:Postage
^
D2/20'2007
T-21.74
PBest Buy
LComputer:Network
^
D2/23'2007
T-37.50
PHess Express
LAutomobile:Gasoline
^
D2/24'2007
M024188
T-57.57
PComcast
LBills:Cable Modem
^
D2/24'2007
T-19.98
PMacys - Peabody
LClothing
^
D2/24'2007
T-58.90
PTarget
LClothing
SClothing
$-19.98
SReimbursable:Job
ESnacks
$-11.77
SPersonal Care
$-22.98
SHouse:Cleaning
$-4.17
^
D2/24'2007
T-64.96
PSears
LClothing
^
D2/24'2007
T-20.95
PFabric Place
LMiscellaneous:Books
^
D3/3'2007
T-35.11
P99 Restaurant
LFood:Dining Out
^
D3/7'2007
T-61.96
PMotherhood Maternity
LClothing
^
D3/8'2007
T-26.24
PMicro Center
LMiscellaneous:Cell Phone Acc.
^
D3/8'2007
T-23.63
PThe Body Shop
LPersonal Care
^
D3/12'2007
T-32.19
PTarget
LClothing
^
D3/14'2007
T1,170.28
L[Citizens Bank Checking]
^
D3/18'2007
M018294
T-75.40
PVerizon Wireless
LBills:Cell Phone
^
D3/19'2007
T-52.00
PCarli Convenience
LAutomobile:Gasoline
^
D3/20'2007
T-24.15
PPeach's Citgo
LAutomobile:Gasoline
^
D3/22'2007
T-111.56
PTarget
LClothing
SClothing
$-31.96
SHouse:Kitchen Stuff
ESlow Cooker
$-52.49
SMiscellaneous:Toiletries
EHair Spray
$-2.98
SGifts:Card
ETim BDay
$-3.14
SHouse:Kitchen Stuff
EStep Can
$-20.99
^
D3/22'2007
T-51.38
PLowes
LHome Improvement:Basement
^
D3/24'2007
M26845634
T-57.58
PComcast
LBills:Cable Modem
^
D3/28'2007
T-10.69
PCVS
LHealthcare:Allergy Medicine
SHealthcare:Allergy Medicine
$-6.29
SMiscellaneous:Office Supplies
$-4.40
^
D3/29'2007
T-9.00
P333 Longwood Ave Garage
LMiscellaneous:Parking
^
D3/31'2007
T-52.47
PLowes
LHouse:Storage
^
D3/31'2007
T-10.00
PBurlington Car Wash
LAutomobile:Car Wash
^
D4/3'2007
MMembership Renewal
T-30.00
PBJs Wholesale
LBills:Membership Fees
^
D4/3'2007
T-40.00
PCarli Convenience
LAutomobile:Gasoline
^
D4/7'2007
T-26.49
PMotherhood Maternity
LClothing
^
D4/7'2007
MJennifer
T-28.00
PCarli Convenience
LAutomobile:Gasoline
^
D4/13'2007
T-15.74
PCompleat Gamester Inc Waltham MA
LMiscellaneous:Games
^
D4/14'2007
T-40.00
PHess Express
LAutomobile:Gasoline
^
D4/16'2007
MDJD4YW421ZPN
T575.47
L[Citizens Bank Checking]
^
D4/17'2007
T-24.50
POld Navy
LClothing:Maternity
^
D4/18'2007
M018497
T-67.36
PVerizon Wireless
LBills:Cell Phone
^
D4/21'2007
T-250.00
PThomas More Law Center
LCharitable Donation
^
D4/21'2007
T-34.96
PMacys - Burlington
LClothing:Maternity
^
D4/21'2007
T-146.87
PMotherhood Maternity
LClothing:Maternity
^
D4/25'2007
M27949051
T-57.58
PComcast
LBills:Cable Modem
^
D4/26'2007
T-5.68
PShell
LAutomobile:Gasoline
^
D4/26'2007
MJennifer
T-42.00
PCarli Convenience
LAutomobile:Gasoline
^
D4/27'2007
T-146.45
PJC Penny
LClothing:Maternity
^
D4/29'2007
T-25.47
PAmazon.com
LMiscellaneous:Power Meter
^
D5/1'2007
T-402.37
PO'Connor True Value
LHome Improvement:Lawn Mower
SHome Improvement:Lawn Mower
$-388.49
SHouse:Garden
ENozzles
$-10.49
SHouse:Lightbulbs
EHalogen Lightbulbs
$-8.39
SCoupon
$5.00
^
D5/1'2007
T-29.00
PBillerica Tire and Auto
LAutomobile:Inspection
^
D5/1'2007
T-214.11
PSunrocket
LBills:Phone
^
D5/2'2007
T-55.27
PAmazon.com
LHealthcare:Blood Pressure Monitor
SHealthcare:Blood Pressure Monitor
$-44.81
SMiscellaneous:Books
$-10.46
^
D5/2'2007
T-18.14
PWalmart - Huntsville
LHousehold
^
D5/8'2007
T-82.86
PTarget
LPersonal Care:Misc
SPersonal Care:Misc
$-28.78
SHouse:Laundry
$-12.59
SFood:Groceries
ECereal
$-10.00
SHouse:Laundry
ELaundry Sorter
$-31.49
S
$0.00
^
D5/8'2007
T-20.92
PFabric Place
LHousehold:Drapes
^
D5/8'2007
MJennifer
T-31.50
PCarli Convenience
LAutomobile:Gasoline
^
D5/11'2007
M011220
T-67.71
PVerizon Wireless
LBills:Cell Phone
^
D5/12'2007
T-46.25
PHess Express
LAutomobile:Gasoline
^
D5/12'2007
T-45.42
PBugaboo Creek
LFood:Dining Out
^
D5/12'2007
T-57.08
PBed Bath & Beyond
LHouse
^
D5/12'2007
T-76.92
PKMart
^
D5/12'2007
T-11.53
PCVS
LHealthcare:Allergy Medicine
SHealthcare:Allergy Medicine
$-8.54
SHealthcare
$-2.99
^
D5/12'2007
T-60.82
PO'Connor True Value
LHouse:Garden
^
D5/13'2007
T-14.66
PThe Flower Outlet
LHouse:Garden
^
D5/16'2007
MCDHQVBYWNDRM 
T634.46
L[Citizens Bank Checking]
^
D5/18'2007
MTracking number: 28780790
T-57.58
PComcast
LBills:Cable Modem
^
D5/19'2007
T-8.40
PPost Office
LMiscellaneous:Postage
^
D5/21'2007
T-13.99
PJC Penny
LClothing:Maternity
^
D5/22'2007
T-16.37
PMichaels Crafts
LMiscellaneous:Arts-Crafts
^
D5/22'2007
T-102.50
PLowes
LHome Improvement:Office
^
D5/26'2007
M3.119/gal
T-43.00
PShell - Milton PA
LAutomobile:Gasoline
^
D5/26'2007
T-27.41
PPetro of Milton
LFood:Dining Out
^
D5/26'2007
T-126.55
PHampton Inn Lamar, PA
LVacation:Lodging
^
D5/27'2007
MDuBois, PA
T-22.33
PPerkins
LFood:Dining Out
^
D5/27'2007
M3.439/gal
T-54.00
POak Openings Plaza, Swanton, OH
LAutomobile:Gasoline
^
D5/27'2007
MAngola, IN
T-20.46
PApplebees
LFood:Dining Out
^
D5/28'2007
T-98.91
PHampton Inn Fremont, IN
LVacation:Lodging
^
D5/29'2007
MFremont, IN
T-78.42
PLevi's Outlet Store
LClothing
SClothing
$-57.22
SClothing:Sunglasses
$-21.20
^
D5/29'2007
M3.369/gal
T-53.00
PDan's Petroleum
LAutomobile:Gasoline
^
D6/3'2007
Myarn
T-7.36
PMichaels Crafts
LMiscellaneous:Arts-Crafts
^
D6/4'2007
M3.359/gal
T-42.50
PClark - Beloit
LAutomobile:Gasoline
^
D6/4'2007
T-22.78
PBob Evans Restraunt
LFood:Dining Out
^
D6/5'2007
MAngola Service Plaza
T-17.35
PLavazza & Sandellas Pizza
LFood:Dining Out
^
D6/5'2007
T-46.25
PShell - Vermilion, OH
LAutomobile:Gasoline
^
D6/5'2007
T-115.52
PHampton Inn Fremont, OH
LVacation:Lodging
^
D6/5'2007
T-131.19
PHampton Inn Niagara Falls, NY
LVacation:Lodging
^
D6/6'2007
MTop of the falls store
T-17.96
PNiagara Falls Gift Shop
LMiscellaneous
^
D6/6'2007
M3.169/gal - Syracuse, NY
T-48.88
PSunoco
LAutomobile:Gasoline
^
D6/8'2007
T16.40
PJC Penny
LClothing
^
D6/9'2007
T-35.62
PO'Connor True Value
LHome Improvement
^
D6/10'2007
MMom's Birthday
T-69.74
PTexas Roadhouse
LFood:Dining Out
^
D6/10'2007
M2.899/gal
T-44.00
PCumberland Farms
LAutomobile:Gasoline
^
D6/11'2007
M011511
T-67.71
PVerizon Wireless
LBills:Cell Phone
^
D6/13'2007
T-7.28
PBorders
LEducation:Books
^
D6/15'2007
T9.98
PMacys - Burlington
LClothing:Maternity
^
D6/15'2007
T-53.94
PMotherhood Maternity
LClothing:Maternity
^
D6/16'2007
T-32.00
PCarli Convenience
LAutomobile:Gasoline
^
D6/17'2007
MBaby Room Rug
T-159.85
PTarget.com
LHousehold
^
D6/19'2007
MDL30G8XXLVBP
T2,035.43
L[Citizens Bank Checking]
^
D6/20'2007
MBedroom Furniture
T-932.30
PDonahue's Furniture
LHouse:Furniture
^
D6/21'2007
T-42.78
PKMart
^
D6/22'2007
T-46.50
PHaffners
LAutomobile:Gasoline
^
D6/22'2007
T-666.99
PCircuit City
LMiscellaneous:CamCorder
^
D6/23'2007
T-33.56
PKMart
^
D6/24'2007
MTracking number: 30047195
T-57.58
PComcast
LBills:Cable Modem
^
D6/26'2007
T-6.08
PCVS
LPersonal Care:Makeup
^
D6/29'2007
MCourtyard By Marriott
T-296.96
PMarriott - Huntsville
^
D6/29'2007
T-318.62
PHyatt - Arlington VA
^
D6/29'2007
MHuntsville Trip
T-84.00
PLogan Airport Parking
^
D7/2'2007
T-24.76
PBickfords Grill
LFood:Dining Out
^
D7/4'2007
T-52.47
PO'Connor True Value
LHome Improvement
^
D7/6'2007
T-69.82
PO'Connor True Value
LHome Improvement
^
D7/6'2007
M2.819/gal
T-45.00
PCumberland Farms
LAutomobile:Gasoline
^
D7/7'2007
T-86.17
PKohls
LClothing
^
D7/7'2007
T-31.70
PTarget
LHouse:Storage
SHouse:Storage
$-25.17
SHouse:Kitchen Stuff
$-5.49
SMiscellaneous
$-1.04
^
D7/7'2007
T-16.99
PMotherhood Maternity
LClothing:Maternity
^
D7/7'2007
MLynette
T-83.90
PCrate & Barrel
LGifts:Birthday
^
D7/8'2007
MShop Vac Filter
T-15.72
PHome Depot
LHome Improvement
^
D7/10'2007
M221835
T-50.00
PBrownback for President
LPolitical Contribution
^
D7/10'2007
M010510
T-67.71
PVerizon Wireless
LBills:Cell Phone
^
D7/11'2007
T-50.00
PCatholic Answers
LCharitable Donation
^
D7/11'2007
M2.919/gal
T-31.75
PCarli Convenience
LAutomobile:Gasoline
^
D7/15'2007
MJenni, Mom, and I
T-50.45
P99 Restaurant
LFood:Dining Out
^
D7/15'2007
T-37.03
PTarget
LMiscellaneous
SMiscellaneous
EHangers
$-3.44
SHouse:Cleaning
ETide
$-5.25
SMiscellaneous
EBirthing Ball
$-28.34
^
D7/15'2007
M2.819/gal
T-45.00
PHess Express
LAutomobile:Gasoline
^
D7/15'2007
MGH2D98WMY2P5 
T1,380.66
L[Citizens Bank Checking]
^
D7/17'2007
MOdometer
T-532.95
PHerb Chambers Honda
LAutomobile:Maintenance
^
D7/19'2007
MBirthday
T-48.03
PCheesecake Factory
LFood:Dining Out
^
D7/21'2007
T-26.43
PBertuccis
LFood:Dining Out
^
D7/22'2007
T160.58
PSunrocket
^
D7/22'2007
T0.00
PTEMPORARY CREDIT PENDING INVESTI
^
D7/23'2007
MWrist Brace
T-27.56
PCVS
LHealthcare
^
D7/25'2007
T-400.00
PB&D House of Carpets
LHome Improvement:Flooring
^
D7/26'2007
M2.719/gal
T-42.75
PJimmy's Mini-serve
LAutomobile:Gasoline
^
D7/26'2007
MKathy Rink
T-32.75
PBabies R Us
LGifts:Shower
^
D7/26'2007
T-168.05
PBabies R Us
LBaby Stuff
^
D7/27'2007
MTracking number: 31326193
T-57.58
PComcast
LBills:Cable Modem
^
D7/27'2007
T-94.43
PO'Connor True Value
LHome Improvement:Paint
^
D7/27'2007
MKathy Rink
T-7.30
PBarnes & Noble
LGifts:Shower
^
D7/28'2007
T-13.84
PAngelina's Pizza
LFood:Dining Out
^
D7/29'2007
T-10.27
PO'Connor True Value
LHome Improvement:Paint
^
D7/30'2007
T-88.44
PKMart
LHouse
SHouse
$-52.50
SPersonal Care
EMisc
$-35.94
^
D7/30'2007
MWrist Brace
T-27.29
PCVS
LHealthcare
^
D8/3'2007
T-25.86
PJiffy Lube - Bedford
LAutomobile:Maintenance
^
D8/4'2007
M$2.599/gal
T-39.50
PPrime
LAutomobile:Gasoline
^
D8/8'2007
T-48.92
PTarget
LBaby Stuff
SBaby Stuff
$-25.28
SPersonal Care
EMakeup
$-13.51
SMiscellaneous
$-10.13
S
$0.00
^
D8/8'2007
T-76.90
PO'Connor True Value
LHome Improvement:Paint
^
D8/8'2007
T-28.54
PLowes
LHome Improvement:Office
^
D8/8'2007
T-466.06
PB&D House of Carpets
LHome Improvement:Flooring
^
D8/9'2007
M$2.579/gal
T-30.00
PPrime
LAutomobile:Gasoline
^
D8/10'2007
T-104.92
PMotherhood Maternity
LClothing:Maternity
^
D8/10'2007
T-66.95
PGreen Mountain Diapers
LBaby Stuff:Diapers
^
D8/10'2007
T-26.00
PConsumer Reports
LBills:Magazine
^
D8/10'2007
T-72.99
PThanks Mama
LBaby Stuff:Diapers
^
D8/11'2007
T-26.46
PThe Body Shop
LPersonal Care
^
D8/11'2007
MBedroom Furniture - Final Payment
T-1,900.00
PDonahue's Furniture
LHouse:Furniture
^
D8/11'2007
T-68.95
PRadio Shack
LHome Improvement
^
D8/11'2007
T-166.05
PFabric Place
LHome Improvement:Baby's Room
^
D8/11'2007
T-479.99
PCircuit City
LComputer:Laptop
^
D8/11'2007
T-155.94
PBabies R Us
LBaby Stuff
^
D8/12'2007
M012188
T-67.63
PVerizon Wireless
LBills:Cell Phone
^
D8/14'2007
MCrib - In-Store Pickup
T-299.97
PWalmart
LBaby Stuff
^
D8/14'2007
T-75.39
PKMart
LBaby Stuff
SBaby Stuff
$-28.47
SPersonal Care
EMisc
$-2.99
SClothing
$-3.96
SFood:Candy
$-1.69
SPersonal Care:Vitamins
$-10.49
SMiscellaneous
$-27.79
^
D8/15'2007
ML28J0VCXB80R
T3,397.62
L[Citizens Bank Checking]
^
D8/16'2007
T-35.47
PJo-Ann Fabric
LHobbies-Leisure
^
D8/16'2007
M2.539/gal
T-41.00
PPrime
LAutomobile:Gasoline
^
D8/16'2007
T160.58
PAN ADJUSTMENT TO YOUR ACCOUNT
^
D8/16'2007
T-160.58
PSunrocket
^
D8/22'2007
T-35.24
PKMart
LMiscellaneous:Batteries
SMiscellaneous:Batteries
ECamera
$-11.54
SHouse:Cleaning
$-13.93
SFood:Groceries
$-2.99
SBaby Stuff:Diapers
$-9.99
SMiscellaneous
$-3.45
S
ECoupons - Savings
$6.66
^
D8/23'2007
T-28.48
PPost Office
LMiscellaneous:Postage
^
D8/23'2007
T-19.07
PO'Connor True Value
LHome Improvement
^
D8/25'2007
MTracking number: 32496447
T-57.58
PComcast
LBills:Cable Modem
^
D8/25'2007
T-32.94
PLowes
LHome Improvement:Office
^
D8/26'2007
T-30.97
PFocaccia
LFood:Dining Out
^
D8/27'2007
M$2.499/gal
T-25.00
PPrime
LAutomobile:Gasoline
^
D9/4'2007
MCell Phone Extender
T-323.35
PAmazon.com
LHouse
^
D9/5'2007
Mvjhz2283
T-100.00
PCatholic Answers
LCharitable Donation
^
D9/11'2007
T-184.90
PISIS Maternity
LBaby Stuff:Pump
^
D9/11'2007
M011728
T-67.63
PVerizon Wireless
LBills:Cell Phone
^
D9/12'2007
T-46.55
PO'Connor True Value
LHome Improvement
^
D9/12'2007
T-132.87
PCarson Wrapped Hershey's
LBaby Stuff
^
D9/15'2007
M$2.519/gal
T-39.00
PCumberland Farms
LAutomobile:Gasoline
^
D9/15'2007
T-42.84
PMarket Basket
LFood:Groceries
^
D9/15'2007
MM48VN1DPXJ30
T5,726.14
L[MIT EFCU Share Draft]
^
D9/20'2007
MHeadset
T-31.49
PRadio Shack
LMiscellaneous:Cell Phone Acc.
^
D9/20'2007
MMembership Renewal
T-76.00
PAAA
LAutomobile:AAA
^
D9/22'2007
T-36.53
PMarket Basket
LFood:Groceries
^
D9/25'2007
MTracking number: 33767164
T-57.58
PComcast
LBills:Cable Modem
^
D9/25'2007
M$2.639/gal
T-20.00
PCarli Convenience
LAutomobile:Gasoline
^
D9/26'2007
T-102.96
PAmazon.com
LComputer:Software
SComputer:Software
EPremier Elements
$-90.01
SMiscellaneous:Music
$-12.95
^
D10/1'2007
T-49.98
PStop & Shop
LFood:Groceries
^
D10/4'2007
T-68.92
PMotherhood Maternity
LClothing:Maternity
^
D10/9'2007
M2.639/gal
T-20.00
PCarli Convenience
LAutomobile:Gasoline
^
D10/9'2007
MReplayTv
T-114.95
PEaglebit.com
LComputer:Hard Drive
^
D10/10'2007
MPump Rental Deposit
T40.00
PISIS Maternity
LBaby Stuff:Pump
^
D10/11'2007
T-31.48
PRadio Shack
LMiscellaneous
^
D10/12'2007
MJenni and I
T-33.08
P99 Restaurant
LFood:Dining Out
^
D10/14'2007
M014123
T-67.63
PVerizon Wireless
LBills:Cell Phone
^
D10/16'2007
MMP2X109RJPCP
T1,161.05
L[MIT EFCU Share Draft]
^
D10/17'2007
M$2.629/gal
T-31.00
PCumberland Farms
LAutomobile:Gasoline
^
D10/19'2007
T-140.68
PTarget
LBaby Stuff:Diapers
SBaby Stuff:Diapers
$-6.99
SBaby Stuff
$-88.22
SHousehold
$-45.47
^
D10/20'2007
T-40.57
PLowes
LHome Improvement:Baby's Room
^
D10/22'2007
MSneakers
T-29.99
PBob's Stores - Billerica
LClothing:Footware
^
D10/24'2007
T-15.39
PO'Connor True Value
LHome Improvement
^
D10/24'2007
T-26.39
PMarket Basket
LFood:Groceries
^
D10/24'2007
T-141.30
PGreen Mountain Diapers
LBaby Stuff:Diapers
^
D10/25'2007
MTracking number: 35037494
T-57.57
PComcast
LBills:Cable Modem
^
D10/25'2007
T-144.70
PBabies R Us
LBaby Stuff
SBaby Stuff
$-41.18
SGifts:Shower
$-54.63
SCharitable Donation:Church
EBaby Clothes
$-48.89
^
D10/29'2007
M2.719/gal
T-39.60
PCarli Convenience
LAutomobile:Gasoline
^
D10/29'2007
T-48.50
PMarket Basket
LFood:Groceries
^
D10/31'2007
M$2.759/gal
T-33.50
PCarli Convenience
LAutomobile:Gasoline
^
D11/3'2007
Myarn
T-15.14
PMichaels Crafts
LMiscellaneous:Arts-Crafts
^
D11/6'2007
T-86.48
PKMart
LBaby Stuff:Clothing
SBaby Stuff:Clothing
$-35.55
SHousehold
$-53.93
S
ECoupons - Savings
$3.00
^
D11/7'2007
T-29.00
PBillerica Tire and Auto
LAutomobile:Inspection
^
D11/7'2007
T-30.61
PJiffy Lube - Bedford
LAutomobile:Maintenance
^
D11/16'2007
M016864
T-67.57
PVerizon Wireless
LBills:Cell Phone
^
D11/16'2007
M1M6XXV4QMP81
T752.44
L[MIT EFCU Share Draft]
^
D11/16'2007
M$2.999/gal
T-30.00
PCarli Convenience
LAutomobile:Gasoline
^
D11/20'2007
T-100.99
PKohls
LClothing
^
D11/20'2007
MBattery
T-118.48
PSears
LAutomobile
^
D11/24'2007
M36340161
T-57.57
PComcast
LBills:Cable Modem
^
D11/25'2007
M12 Issues/Christopher
T-15.97
PPopular Mechanics
LGifts
^
D11/27'2007
T-56.62
PSears
LMiscellaneous
^
D11/28'2007
T-96.97
PTarget
LMiscellaneous:Christmas
SMiscellaneous:Christmas
$-88.14
SHousehold
$-2.96
SFood:Groceries
$-5.87
^
D11/28'2007
T8.39
PKMart
^
D11/28'2007
T-73.95
PPotty Pail
LBaby Stuff
^
D11/30'2007
T-30.43
PKMart
LHouse:Storage
^
D12/4'2007
MReplay
T-94.49
PMicro Center
LComputer:Hard Drive
^
D12/4'2007
M$2.999/gal
T-35.00
PCarli Convenience
LAutomobile:Gasoline
^
D12/5'2007
T-62.33
PThanks Mama
LBaby Stuff:Diapers
^
D12/6'2007
T-15.98
PLa Cascias Bakery & Deli
^
D12/8'2007
T-416.85
PBabies R Us
LGifts:Shower
SGifts:Shower
EC&L
$-40.92
SBaby Stuff:Pump
$-293.99
SBaby Stuff:Toys
$-41.96
SBaby Stuff
$-39.98
^
D12/8'2007
T-34.50
PApplebees
LFood:Dining Out
^
D12/10'2007
M$2.939/gal
T-44.00
PCumberland Farms
LAutomobile:Gasoline
^
D12/11'2007
T-585.25
PChapman Fuel
LBills:Heat
^
D12/12'2007
MChristmas gifts - Church Giving Tree
T-131.56
PWalmart
LCharitable Donation
^
D12/15'2007
T-20.99
PCVS
LGifts:Christmas
^
D12/16'2007
T-50.35
PMichaels Crafts
LGifts:Christmas
SGifts:Christmas
$-49.35
S
$-1.00
^
D12/17'2007
T-15.99
PAmazon.com
LGifts:Christmas
^
D12/17'2007
T-7.50
PAmazon.com
LGifts:Christmas
^
D12/17'2007
T-37.15
PAmazon.com
LGifts:Christmas
^
D12/17'2007
T-7.99
PAmazon.com
LGifts:Christmas
^
D12/17'2007
T-29.20
PAmazon.com
LGifts:Christmas
^
D12/18'2007
MNPHCH802YY9
T910.42
L[MIT EFCU Share Draft]
^
D12/19'2007
T-26.58
PPost Office
LMiscellaneous:Postage
^
D12/19'2007
T-25.00
PBest Buy
LGifts:Christmas
^
D12/19'2007
T-25.00
PBest Buy
LGifts:Christmas
^
D12/21'2007
M$2.919/gal
T-25.00
PPrime
LAutomobile:Gasoline
^
D12/22'2007
T-27.76
PJohnny Rockets
LFood:Dining Out
^
D12/22'2007
T-26.40
PSears
LGifts:Christmas
^
D12/23'2007
T-49.59
PAmazon.com
LGifts:Christmas
^
D12/24'2007
T-43.39
PHarrolds Gifts
LGifts:Christmas
^
D12/25'2007
T-20.00
PO'Connor True Value
LGifts:Christmas
^
D12/26'2007
T-13.15
PDunkin Donuts
LFood:Dining Out
SFood:Dining Out
$-3.03
SGifts:Christmas
$-10.12
^
D12/28'2007
MGift card - free Pizza
T-25.00
L[Papa Ginos Gift Card]
^
D12/28'2007
MGift card - free Pizza
T-25.00
L[Papa Ginos Gift Card]
^
D12/29'2007
T-43.73
PMarket Basket
LFood:Groceries
^
D12/29'2007
T-21.62
PWinchester Hospital Gift Shop
LGifts:Baby
^
D12/31'2007
T-250.00
PThomas More Law Center
LCharitable Donation
^
D1/2'2008
Mfmxq8823
T-250.00
PCatholic Answers
LCharitable Donation
^
D1/5'2008
T-38.73
PTarget
LHousehold
^
D1/5'2008
T-72.79
PBabies R Us
LBaby Stuff:Toys
SBaby Stuff:Toys
$-62.98
SBaby Stuff:Clothing
$-34.81
S
EGift Card
$25.00
^
D1/14'2008
T-39.34
PCVS
LHealthcare:FSA
^
D1/15'2008
MB98VJ03YLR7G
T2,060.12
L[MIT EFCU Share Draft]
^
D1/18'2008
T-3.00
PAirport Cart Rental
LVacation:Travel
^
D1/19'2008
T-44.89
PWalmart
LBaby Stuff:Diapers
SBaby Stuff:Diapers
$-8.44
SBaby Stuff:Wipes
$-2.50
SBaby Stuff:Formula
$-11.97
SBaby Stuff
EBottle Brush
$-2.07
SClothing
ESweatpants
$-7.39
SFood:Groceries
$-12.52
^
D1/25'2008
M$2.899/gal
T-37.75
PSuperAmerica
LAutomobile:Gasoline
^
D1/25'2008
MMSP
T-3.00
PAirport Cart Rental
LVacation:Travel
^
D1/25'2008
MCart Rental - no refund!
T-3.00
PAirport Cart Rental
LVacation:Travel
^
D1/25'2008
T-208.63
PHertz - MSP
LVacation:Car Rental
^
D1/27'2008
MSean - Bible
T-40.21
PPersonalizationmall.com
LGifts:Baby
^
D1/31'2008
T-126.31
PBabies R Us
LBaby Stuff:Clothing
SBaby Stuff:Clothing
$-30.98
SBaby Stuff
$-95.33
^
D1/31'2008
T-51.33
PLowes
LHome Improvement:Baby's Room
^
D1/31'2008
M$2.899/gal
T-45.00
PPrime
LAutomobile:Gasoline
^
D2/2'2008
T-25.25
PCumberland Farms
LFood:Dining Out
^
D2/5'2008
T-47.98
PMotherhood Maternity
LClothing:Maternity
^
D2/5'2008
T-23.08
PKohls
LClothing
SClothing
$-7.34
SHousehold:Furnishings
EPicture frame
$-15.74
^
D2/6'2008
T-70.75
PKMart
LHouse:Storage
SHouse:Storage
$-29.39
SPersonal Care:Shaving Supplies
$-41.36
^
D2/9'2008
MJennifer
T-41.00
PRegistry of Motor Vehicles
LAutomobile:Registration
^
D2/11'2008
T-46.37
PGreen Mountain Diapers
LBaby Stuff:Diapers
^
D2/13'2008
T-73.98
PO'Connor True Value
LHome Improvement:Basement
^
D2/15'2008
MC4PQVGDCMMN9
T1,217.25
L[MIT EFCU Share Draft]
^
D2/15'2008
T-192.99
PJC Penny
LHousehold:Drapes
^
D2/18'2008
M$2.919/gal
T-30.00
PCumberland Farms
LAutomobile:Gasoline
^
D2/18'2008
T19.99
PBabies R Us
LBaby Stuff
^
D2/18'2008
T-160.12
PBabies R Us
LBaby Stuff
SBaby Stuff
$-19.99
SGifts:Shower
EKimberlee Chang
$-9.43
SBaby Stuff
$-124.94
SBaby Stuff:Toys
$-5.76
^
D2/18'2008
T-46.50
PTexas Roadhouse
LFood:Dining Out
^
D2/18'2008
T-7.12
PTarget
LBaby Stuff:Clothing
SBaby Stuff:Clothing
$-3.99
SBaby Stuff:Wipes
$-3.13
^
D2/19'2008
T-61.03
PThe Body Shop
LPersonal Care
^
D2/20'2008
T-9.98
PReaders Digest
LBills:Magazine
^
D2/22'2008
MChangnut
T-33.55
PTarget
LGifts:Shower
^
D2/23'2008
T-41.95
PH&R Block Digital Tax Solutions
LComputer:Software
^
D3/3'2008
M$3.029/gal
T-32.00
PCumberland Farms
LAutomobile:Gasoline
^
D3/3'2008
T-30.41
PMichaels Crafts
LHousehold:Decorations
^
D3/5'2008
T-40.30
PKMart
LMiscellaneous
SMiscellaneous
$-21.82
SPersonal Care:Misc
$-15.48
SBaby Stuff:Clothing
$-4.00
SCoupon
$1.00
^
D3/5'2008
T-26.23
PO'Connor True Value
LHome Improvement:Basement
^
D3/8'2008
T-21.00
PBickfords Grill
LFood:Dining Out
^
D3/13'2008
M$3.059/gal
T-46.00
PHess Express
LAutomobile:Gasoline
^
D3/14'2008
T-64.98
PLee.com
LClothing:Jeans
^
D3/15'2008
M9HNQ6QLVWHMH
T817.55
L[MIT EFCU Share Draft]
^
D3/17'2008
T-41.99
POffice Depot
LMiscellaneous:Printer Ink
^
D3/17'2008
T-33.58
PBed Bath & Beyond
LHouse
^
D3/19'2008
T-17.99
PHallmark Gold Crown
LGifts:Card
^
D3/19'2008
T-115.96
PSears
LClothing:Jeans
^
D3/19'2008
T-26.50
P99 Restaurant
LFood:Dining Out
^
D3/19'2008
T-214.50
PMidwest Airlines
LVacation:Travel
^
D3/19'2008
T-214.50
PMidwest Airlines
LVacation:Travel
^
D3/22'2008
M$3.039/gal
T-30.50
PCumberland Farms
LAutomobile:Gasoline
^
D3/22'2008
T-30.06
PCVS
LPersonal Care:Shampoo
SPersonal Care:Shampoo
$-5.24
SPersonal Care:Vitamins
$-20.33
S
EOther
$-4.49
^
D3/25'2008
T-24.65
PO'Connor True Value
LBaby Stuff
SBaby Stuff
EPotty Pail Hook
$-4.71
SBaby Stuff:Babyproofing
ERetractable Key Reel
$-19.94
^
D3/25'2008
T-40.92
PKohls
LHousehold:Decorations
^
D3/25'2008
T-14.66
PCVS
LHousehold:Pictures
^
D3/27'2008
T-12.58
PBed Bath & Beyond
LHousehold:Decorations
^
D3/27'2008
T40.92
PKohls
LHousehold:Decorations
^
D3/27'2008
T-15.00
PKohls
LBaby Stuff:Clothing
^
D3/29'2008
T-26.73
PBurlington Coat Factory
LBaby Stuff:Childproofing
^
D3/29'2008
T-48.78
PMarket Basket
LFood:Groceries
^
D3/30'2008
T-22.70
PThe Black Olive
LFood:Dining Out
^
D4/4'2008
T21.82
PKMart
LMiscellaneous
SMiscellaneous
$-21.82
SPersonal Care:Misc
$-15.48
SBaby Stuff:Clothing
$-4.00
SCoupon
$1.00
^
D4/5'2008
T-61.41
PBurlington Coat Factory
LBaby Stuff:Childproofing
^
D4/5'2008
M$3.069/gal
T-29.00
PHaffners
LAutomobile:Gasoline
^
D4/5'2008
M$3.039/gal
T-45.00
PPrime
LAutomobile:Gasoline
^
D4/6'2008
T5.25
PO'Connor True Value
LHome Improvement:Basement
SHome Improvement:Basement
$-18.89
SHouse:Lightbulbs
$-3.76
SMiscellaneous:Batteries
$-3.66
SMiscellaneous
$-9.10
^
D4/6'2008
T-40.66
PO'Connor True Value
LHome Improvement:Basement
SHome Improvement:Basement
$-18.89
SHouse:Lightbulbs
$-3.76
SMiscellaneous:Batteries
$-3.66
SMiscellaneous
$-14.35
^
D4/8'2008
MNew Cell Phone - Expect $50 Rebate
T-115.50
PWireless Zone (Verizon Wireless)
LMiscellaneous:Cell Phone Acc.
^
D4/9'2008
T-12.93
PPost Office
LMiscellaneous:Postage
^
D4/12'2008
T-100.99
PBabies R Us
LBaby Stuff:Toys
SBaby Stuff:Toys
$-15.22
SBaby Stuff:Childproofing
$-61.92
SBaby Stuff
$-28.84
^
D4/15'2008
MDCJ7BL8JHQD1
T833.17
L[MIT EFCU Share Draft]
^
D4/18'2008
T-35.00
PBJs Wholesale
LBills:Membership Fees
^
D4/21'2008
T-29.99
PWalmart
LHousehold
^
D4/21'2008
T-25.20
PWalmart
LMiscellaneous:Watch
^
D4/22'2008
T-178.02
PHonolulu Airport Hotel
LReimbursable:Job
^
D4/23'2008
T-86.37
PKohls
LClothing
^
D4/26'2008
T-64.67
PTarget
LBaby Stuff:Toys
SBaby Stuff:Toys
$-40.17
SHealthcare
ERanitidine
$-5.71
SBaby Stuff
$-2.88
^
D4/30'2008
T-9.21
PCVS
LPersonal Care
SPersonal Care
$-3.98
SHealthcare:FSA
$-5.23
^
D4/30'2008
T-178.02
PHonolulu Airport Hotel
LReimbursable:Job
^
D5/7'2008
T-9.42
PHallmark Gold Crown
LGifts:Card
^
D5/15'2008
MC86290R8M5GX
T1,334.08
L[MIT EFCU Share Draft]
^
D5/19'2008
T-44.32
PTarget
LPersonal Care:Contact Solution
SPersonal Care:Contact Solution
$-4.19
SPersonal Care:Shampoo
$-3.30
SBaby Stuff:Clothing
$-2.98
SHousehold
$-33.85
^
D5/19'2008
M$3.779/gal
T-52.60
PCarli Convenience
LAutomobile:Gasoline
^
D5/22'2008
MMother's Day
T-67.00
PTexas Roadhouse
LFood:Dining Out
^
D5/22'2008
T-28.97
PBabies R Us
LBaby Stuff:Clothing
^
D5/23'2008
M$3.819/gal
T-43.50
PPrime
LAutomobile:Gasoline
^
D5/24'2008
T-142.95
PKohls
LClothing
^
D5/26'2008
T-18.39
PSears
LClothing
^
D5/27'2008
Mnsxk1488
T-39.95
PThis Rock
LBills:Magazine
^
D5/29'2008
T-58.24
PWalmart
LFood:Groceries
SFood:Groceries
$-6.93
SBaby Stuff:Clothing
$-21.80
SHousehold
$-29.51
^
D5/29'2008
T-17.98
PMarshalls
LBaby Stuff:Clothing
^
D5/30'2008
T-17.80
PKohls
LClothing
^
D5/30'2008
T-61.78
PSears
LClothing
^
D5/31'2008
T-62.74
PO'Connor True Value
LHouse:Grill
SHouse:Grill
ETank & Refill
$-48.28
SHouse:Lightbulbs
$-2.93
SMiscellaneous
$-11.53
^
D5/31'2008
T-25.84
PStop & Shop
LFood:Groceries
SFood:Groceries
$-21.97
SGifts:Card
$-3.87
^
D6/4'2008
MCart Rental
T-3.00
PAirport Cart Rental
LVacation:Travel
^
D6/5'2008
T-3.00
PAirport Cart Rental
LVacation:Travel
^
D6/13'2008
T-77.29
PApplebees
LFood:Dining Out
^
D6/14'2008
T-15.72
PPizza Hut
LFood:Dining Out
^
D6/14'2008
T-45.00
PSpeedway
LAutomobile:Gasoline
^
D6/14'2008
T-111.86
PComfort Inn - Beloit
LVacation:Lodging
^
D6/14'2008
T-131.61
PHampton Inn West Bend, WI
LVacation:Lodging
^
D6/15'2008
MGDH3CLRZRZ5D
T615.90
L[MIT EFCU Share Draft]
^
D6/15'2008
M$3.899/gal Waupaca, WI
T-20.26
PBP
LAutomobile:Gasoline
^
D6/16'2008
T-6.00
PMidwest Airlines
LFood:Dining Out
^
D6/16'2008
T-534.28
PHertz - MSP
LVacation:Car Rental
^
D6/18'2008
T-35.50
PCumberland Farms
LAutomobile:Gasoline
^
D6/20'2008
T-136.51
PKMart
LHouse:Kitchen Stuff
SHouse:Kitchen Stuff
$-11.53
SHousehold:Decorations
$-36.72
SBaby Stuff:Childproofing
$-3.14
SHouse:Bathroom Stuff
$-6.29
SHouse:Garden
EFlowers
$-56.57
SFood:Groceries
$-22.26
^
D6/20'2008
T-30.66
PAmazon.com
^
D6/21'2008
T-29.95
PJiffy Lube - Billerica
LAutomobile:Maintenance
^
D6/21'2008
T-49.78
PO'Connor True Value
LHome Improvement
^
D6/24'2008
T6.29
PO'Connor True Value
^
D6/24'2008
T-12.91
PAmazon.com
^
D6/27'2008
M$4.079/gal
T-60.01
PCarli Convenience
LAutomobile:Gasoline
^
D6/30'2008
T-38.81
PBed Bath & Beyond
LHousehold
^
D7/2'2008
T-40.00
PRegistry of Motor Vehicles
LAutomobile:License Renewal
^
D7/2'2008
T-47.98
PMarshalls
LClothing
SClothing
$-36.98
SBaby Stuff:Clothing
$-11.00
^
D7/2'2008
T-102.68
PTarget
LHouse:Storage
SHouse:Storage
$-50.34
SPersonal Care:Shampoo
$-1.96
SFood:Groceries
$-1.09
SBaby Stuff
$-3.14
SHousehold
$-46.15
^
D7/2'2008
T-108.02
PWalmart
LFood:Groceries
SFood:Groceries
$-15.20
SClothing:Jeans
$-34.84
SClothing:Footware
$-18.71
S
EWDF-3500
$-39.27
^
D7/5'2008
T-17.83
PCVS
LPersonal Care:Vitamins
SPersonal Care:Vitamins
$-16.79
SBaby Stuff:Toys
EBubbles
$-1.04
^
D7/8'2008
T17.99
PKohls
LClothing
^
D7/11'2008
Mgxyc6041 - Two years
T-71.95
PThis Rock
LBills:Magazine
^
D7/14'2008
M$4.079/gal
T-60.60
PCarli Convenience
LAutomobile:Gasoline
^
D7/15'2008
MDR0WYZB8VWZD
T937.93
L[MIT EFCU Share Draft]
^
D7/15'2008
M$4.099/gal
T-19.99
PShell - Bedford
LAutomobile:Gasoline
^
D7/18'2008
T-26.14
PBertuccis
LFood:Dining Out
^
D7/21'2008
M$3.959/gal
T-44.00
PCumberland Farms
LAutomobile:Gasoline
^
D7/22'2008
T-5.24
PHallmark Gold Crown
LGifts:Card
^
D7/26'2008
T-43.75
PPrime
LAutomobile:Gasoline
^
D7/28'2008
T-41.97
PLowes
LHouse:Shelves
^
D7/31'2008
T-41.97
PBed Bath & Beyond
LHousehold
SHousehold
$-8.38
SHouse:Kitchen Stuff
$-33.59
^
D7/31'2008
T-69.45
PTarget
S
ET Fitted 250
$-6.29
S
ET Flat 250TC
$-6.29
SBaby Stuff
$-11.94
SFood:Groceries
$-2.76
SPersonal Care:Shampoo
$-3.09
SBaby Stuff:Babyproofing
$-9.43
SPersonal Care:Toilet Paper
$-6.81
SHouse:Laundry
$-18.89
SHouse:Cleaning
$-3.95
^
D8/2'2008
T-46.35
PO'Connor True Value
LHouse:Garden
SHouse:Garden
ERake
$-11.54
SBaby Stuff:Babyproofing
$-4.40
SHouse:Lightbulbs
EDining Room
$-3.12
SHouse:Moving
EFurniture Dolly
$-27.29
^
D8/2'2008
MReplacement Fan
T-13.57
PWhirlpool Parts
LHouse:Appliances
^
D8/4'2008
T-45.00
PHess Express
LAutomobile:Gasoline
^
D8/5'2008
T-62.36
PKMart
LHouse:Storage
SHouse:Storage
$-37.80
SBaby Stuff:Toys
ETeethers
$-7.32
SBaby Stuff:Clothing
$-17.24
^
D8/6'2008
M12 Issues/Christopher
T-12.00
PPopular Mechanics
LGifts
^
D8/8'2008
MEnclosure for 500GB drive
T-20.97
PRadio Shack
LComputer:Hard Drive
^
D8/9'2008
MRobot Accessories
T-96.93
PiRobot
LHouse:Appliances
^
D8/9'2008
T-52.59
PAmazon.com
LPersonal Care:Shaving Supplies
^
D8/10'2008
T-26.00
PConsumer Reports
LBills:Magazine
^
D8/10'2008
T-21.06
POutback
LFood:Dining Out
^
D8/13'2008
T-7.33
PBorders
LMiscellaneous:Music
^
D8/13'2008
T-51.90
PDunkin Donuts
LFood:Dining Out
SFood:Dining Out
$-1.90
SGifts:Thank you
$-50.00
^
D8/13'2008
T1,601.19
L[MIT EFCU Share Draft]
^
D8/21'2008
M3.579/gal
T-40.00
PHess Express
LAutomobile:Gasoline
^
D8/21'2008
T-10.34
PWalmart
LGifts:Birthday
SGifts:Birthday
EJoe Rink
$-7.85
SGifts:Birthday
EJoe Kearns
$-2.49
^
D8/22'2008
T-14.02
PTarget
LFood:Groceries
SFood:Groceries
$-4.92
SBaby Stuff:Clothing
$-6.99
SPersonal Care
$-2.11
^
D8/22'2008
T-6.20
PKohls
LBaby Stuff:Clothing
^
D8/23'2008
T6.23
PWhirlpool Parts
LHouse:Appliances
^
D8/23'2008
T-18.67
PCVS
LHouse:Electrical
SHouse:Electrical
EHandy Switch
$-15.58
SBaby Stuff:Toys
EBat
$-3.09
^
D8/23'2008
T-34.05
PIParty
LMiscellaneous:Party Supplies
^
D8/26'2008
T-97.67
PWhirlpool Parts
LHouse:Appliances
^
D8/26'2008
T-118.98
POmaha Steaks
LFood:Groceries
^
D8/28'2008
MJoe's First Birthday
T-136.48
PSears
LMiscellaneous
^
D8/28'2008
M$3.679/gal
T-54.00
PCarli Convenience
LAutomobile:Gasoline
^
D8/29'2008
T-121.75
PJC Penny
LHousehold:Drapes
^
D9/2'2008
T-38.96
PBabies R Us
LBaby Stuff:Toys
SBaby Stuff:Toys
$-4.99
SBaby Stuff:Clothing
$-5.99
SBaby Stuff
EHarness
$-5.99
SBaby Stuff
EPotty
$-21.99
^
D9/2'2008
T-31.46
PTarget
LBaby Stuff:Utensils
SBaby Stuff:Utensils
ECups
$-3.13
SFood:Groceries
$-8.49
S
EUnknown
$-19.84
^
D9/2'2008
M08227261712
T-6.99
PKMart
^
D9/4'2008
T-12.57
PSafe Beginnings
LBaby Stuff:Childproofing
^
D9/4'2008
T-54.10
PO'Connor True Value
LHouse:Lightbulbs
SHouse:Lightbulbs
$-29.01
SHome Improvement:Electrical
EMotion Sensing Switch
$-20.99
SHouse
EBungee Cord
$-1.17
SHome Improvement:Bathroom
ECaulk
$-2.93
^
D9/4'2008
T-15.34
PJo-Ann Fabric
LHousehold
^
D9/6'2008
M2008 Secret Santa Project
T-25.00
PSalute America's Heroes
LCharitable Donation
^
D9/6'2008
Mdnpy4228
T-50.00
PCatholic Answers
LCharitable Donation
^
D9/8'2008
M$3.479/gal
T-40.50
PCumberland Farms
LAutomobile:Gasoline
^
D9/10'2008
T-42.10
PKMart
LPersonal Care:Shampoo
SPersonal Care:Shampoo
$-1.64
SPersonal Care:Misc
$-9.96
SBaby Stuff:Diapers
EDiaper Cream
$-4.15
SHome Improvement:Plants
$-5.59
SHousehold:Sheets
$-17.65
SPersonal Care
$-3.11
^
D9/10'2008
T-649.25
PChapman Fuel
LBills:Heat
^
D9/12'2008
T-25.25
PCVS
LHealthcare
SHealthcare
$-23.26
SGifts:Card
$-1.99
^
D9/13'2008
T-34.07
PO'Connor True Value
LHome Improvement:Garage
SHome Improvement:Garage
EGarage Door Spring
$-22.37
SHouse:Garden
EPotting Soil
$-8.51
SHouse:Kitchen Stuff
ESwivel Spout
$-13.84
SCoupon
$10.65
^
D9/13'2008
T658.44
L[MIT EFCU Share Draft]
^
D9/18'2008
MOil Change
T-39.73
PHerb Chambers Honda
LAutomobile:Oil Change
^
D9/19'2008
T-27.48
PMichaels Crafts
LHousehold:Decorations
^
D9/20'2008
MMembership Renewal
T-77.00
PAAA
LAutomobile:AAA
^
D9/21'2008
T12.48
PMichaels Crafts
LHousehold:Decorations
^
D9/21'2008
T-46.68
PMichaels Crafts
LHousehold:Decorations
^
D9/24'2008
T-46.19
PWalmart
LHouse:Storage
SHouse:Storage
$-5.69
SHousehold:Pictures
EFrames
$-6.30
SPersonal Care
$-1.65
SClothing:Shoes
EJoe
$-16.00
SHouse:Kitchen Stuff
$-0.99
SBaby Stuff
EDiaper Bag
$-15.56
^
D9/27'2008
M$3.439/gal
T-40.00
PCumberland Farms
LAutomobile:Gasoline
^
D9/30'2008
T-29.61
PO'Connor True Value
LHome Improvement:Bathroom
SHome Improvement:Bathroom
EFlange Extension
$-4.23
SHome Improvement:Bathroom
EWax Ring
$-4.23
SBaby Stuff:Childproofing
$-4.23
SHome Improvement:Garage
EGarge Door Spring
$-22.23
SCoupon
$5.31
^
D9/30'2008
T-48.61
PFocaccia
LFood:Dining Out
^
D9/30'2008
T-56.00
PPrime
LAutomobile:Gasoline
^
D10/3'2008
T-9.42
PCVS
LPersonal Care:Toothpaste
SPersonal Care:Toothpaste
$-4.51
SGifts:Card
$-4.91
^
D10/3'2008
T-13.95
PPost Office
LMiscellaneous:Postage
^
D10/13'2008
T1,849.93
L[MIT EFCU Share Draft]
^
D10/15'2008
M$2.879/gal
T-33.00
PPrime
LAutomobile:Gasoline
^
D10/18'2008
T-100.00
PCatholic Answers
LCharitable Donation
^
D10/18'2008
MNew Razor
T-47.49
PAmazon.com
LPersonal Care:Shaving Supplies
^
D10/20'2008
T-91.43
PWalmart
LCharitable Donation
SCharitable Donation
EBaby Shower
$-40.34
SBaby Stuff:Clothing
$-5.00
SBaby Stuff:Utensils
$-7.72
SClothing
$-8.00
SHousehold:House Cleaning
EMop
$-7.71
SHouse:Kitchen Stuff
$-4.66
SClothing
$-18.00
^
D10/21'2008
T-90.72
PThe Body Shop
LPersonal Care
^
D10/22'2008
T6.81
PMichaels Crafts
LHousehold:Decorations
^
D10/22'2008
T-12.83
PMichaels Crafts
LHousehold:Decorations
^
D10/22'2008
T-26.46
PThe Body Shop
LPersonal Care
^
D10/22'2008
MDerek & John
T-135.98
POmaha Steaks
LGifts:Thank you
^
D10/22'2008
T-14.98
PMotherhood Maternity
LClothing:Maternity
^
D10/22'2008
T-13.60
PImage Sunwear
LClothing:Sunglasses
^
D10/24'2008
T-10.49
PHomegoods
LHouse:Bathroom Stuff
^
D10/28'2008
MPoints for free night
T-12.50
PHilton HHonnors
LVacation:Lodging
^
D10/29'2008
T-101.21
PTarget
LBaby Stuff
SBaby Stuff
$-31.03
SHouse:Cleaning
$-3.99
SHouse:Lightbulbs
$-6.30
SPersonal Care:Deodorant
$-6.27
SPersonal Care:Toothpaste
$-1.24
SPersonal Care:Misc
$-19.13
SHousehold
$-15.62
SHouse:Garden
EFlag
$-9.98
SHealthcare
$-7.65
^
D10/29'2008
T-62.11
PLowes
LHouse:Shelves
SHouse:Shelves
$-41.97
SHouse:Storage
$-20.14
^
D10/29'2008
M$2.659/gal
T-41.50
PCarli Convenience
LAutomobile:Gasoline
^
D10/30'2008
T-31.31
P99 Restaurant
LFood:Dining Out
^
D10/31'2008
T-34.69
PO'Connor True Value
LHome Improvement:Gutter Caulk
SHome Improvement:Gutter Caulk
$-5.03
SHome Improvement:Tools
$-3.66
SHouse:Storage
EGarage Hooks for Hose
$-5.55
SHome Improvement:Basement
ELight Fixture
$-30.44
SCoupon
$9.99
^
D11/4'2008
T-10.49
PBed Bath & Beyond
LHouse:Kitchen Stuff
^
D11/4'2008
T-5.24
PLinens 'n Things
LHouse:Kitchen Stuff
^
D11/4'2008
T-12.59
PLinens 'n Things
^
D11/6'2008
T-28.83
PCVS
LPersonal Care:Vitamins
SPersonal Care:Vitamins
$-21.50
SPersonal Care
$-7.33
^
D11/6'2008
T-8.91
PMichaels Crafts
LHousehold:Decorations
^
D11/10'2008
T-10.00
PHealthy cooking Magazine
LGifts:Christmas
^
D11/10'2008
T-29.98
PHealthy cooking Magazine
^
D11/13'2008
T620.02
L[MIT EFCU Share Draft]
^
D11/13'2008
T18.00
PWalmart
^
D11/13'2008
T-42.37
PWalmart
LFood:Groceries
SFood:Groceries
$-7.80
SBaby Stuff:Utensils
$-2.88
SBaby Stuff:Bath
$-4.96
SBaby Stuff:Clothing
$-13.50
SPersonal Care
$-15.12
SCoupon
ECoupons
$1.89
^
D11/15'2008
MExtension Ladder
T-213.24
PO'Connor True Value
LHome Improvement:Tools
^
D11/17'2008
M$1.979/gal
T-22.00
PPrime
LAutomobile:Gasoline
^
D11/24'2008
T-28.00
PMario's Restaurant
LFood:Lunch
^
D11/25'2008
M$1.979/gal
T-29.30
PCarli Convenience
LAutomobile:Gasoline
^
D11/25'2008
T-29.00
PPace Automotive
LAutomobile:Inspection
^
D11/28'2008
T-81.23
PTarget
LMiscellaneous:Watch
SMiscellaneous:Watch
$-13.64
SBaby Stuff:Wipes
$-1.02
SHouse:Laundry
$-20.99
SPersonal Care:Misc
$-1.93
SHousehold:Decorations
$-18.90
SGifts:Card
$-16.79
SPersonal Care:Contact Solution
$-7.96
^
D11/29'2008
T-23.01
PBickfords Grill
LFood:Dining Out
^
D11/29'2008
T-51.94
PToys 'R' Us
LGifts:Baby
^
D12/1'2008
T-56.53
PKMart
LHousehold:Decorations
SHousehold:Decorations
EChristmas Decorations
$-14.66
SClothing
$-20.45
SMiscellaneous
EBottle
$-1.04
SCharitable Donation
ELong Gown - Seniors
$-20.38
^
D12/1'2008
T-369.87
PChapman Fuel
LBills:Heat
^
D12/1'2008
T-17.00
PPost Office
LMiscellaneous:Postage
^
D12/3'2008
T-133.23
PHonolulu Airport Hotel
LReimbursable:Job
^
D12/11'2008
T-19.40
PAmazon.com
LEducation:Books
^
D12/11'2008
T-10.20
PAmazon.com
LEducation:Books
^
D12/11'2008
T-25.00
Pusbgeek.com
LGifts:Christmas
^
D12/12'2008
T-133.23
PHonolulu Airport Hotel
LReimbursable:Job
^
D12/13'2008
T-96.66
PBorders
LGifts:Christmas
^
D12/13'2008
T-84.45
PTarget
LFood:Groceries
SFood:Groceries
EBaby Food
$-3.00
SGifts:Christmas
$-38.59
SGifts:Christmas
EJoe
$-10.38
SCharitable Donation
EBaby Shower
$-28.32
SHouse:Kitchen Stuff
EPumice Stone
$-1.02
SPersonal Care:Toothpaste
EJoe
$-3.14
^
D12/13'2008
T842.90
L[MIT EFCU Share Draft]
^
D12/13'2008
T-91.81
PKohls
LGifts:Christmas
^
D12/16'2008
T-31.00
PFocaccia
LFood:Dining Out
^
D12/16'2008
MLabels
T-12.59
POffice Max
LMiscellaneous
^
D12/16'2008
T-18.74
PCVS
LGifts:Card
^
D12/16'2008
T-30.00
PTexas Roadhouse
LGifts:Christmas
^
D12/16'2008
T-82.33
PTarget
LFood:Groceries
SFood:Groceries
$-6.99
SGifts:Card
$-7.34
SGifts:Christmas
$-68.00
^
D12/18'2008
T-45.25
PPost Office
LMiscellaneous:Postage
^
D12/18'2008
M$1.569/gal
T-17.00
PCumberland Farms
LAutomobile:Gasoline
^
D12/18'2008
T-22.89
PCVS
LGifts:Christmas
^
D12/22'2008
T-36.83
PTarget
LFood:Groceries
SFood:Groceries
$-2.34
S
EHardware-Auto 18x28 Dura R
$-7.34
SPersonal Care:Makeup
EHoliday 08
$-0.72
SPersonal Care:Misc
E56 Qt Box
$-7.34
SHouse
ELawn Stakes
$-19.09
^
D12/22'2008
M$1.559/gal
T-24.00
PPrime
LAutomobile:Gasoline
^
D12/24'2008
T-22.34
PMarket Basket
LFood:Groceries
^
D12/24'2008
MRoof Rake
T-26.25
PO'Connor True Value
LHome Improvement:Tools
^
D12/29'2008
T-16.97
PGuideposts Magazine
LBills:Magazine
^
D12/30'2008
T-16.22
PWalgreens
LHousehold:Decorations
^
D12/31'2008
T-12.10
PStop & Shop
LFood:Groceries
SFood:Groceries
$-2.10
SFood:Lunch
$-10.00
^
D1/2'2009
T-362.73
PChapman Fuel
LReimbursable:Mom
^
D1/4'2009
M$1.799/gal
T-22.86
PExxon Mobil - Wausau WI
LAutomobile:Gasoline
^
D1/4'2009
T-101.14
PHampton Inn Green Bay
LVacation:Lodging
^
D1/6'2009
T-23.21
PSolarex Sunglasses
LClothing:Sunglasses
^
D1/8'2009
MSheila's
T-23.19
PImagination Station
LGifts:Shower
^
D1/11'2009
M$1.799/gal
T-22.00
PPilot - Mauston WI
LAutomobile:Gasoline
^
D1/12'2009
T-392.91
PChapman Fuel
LBills:Heat
^
D1/12'2009
T-13.70
PElder-Beerman
LHouse:Kitchen Stuff
SHouse:Kitchen Stuff
ETable Linens
$-5.27
SClothing
ESweater
$-8.43
^
D1/13'2009
T1,563.66
L[MIT EFCU Share Draft]
^
D1/13'2009
M$1.959/gal
T-20.75
PSpeedway
LAutomobile:Gasoline
^
D1/13'2009
T-438.46
PHertz - Milwaukee
LVacation:Car Rental
^
D1/13'2009
MBeloit
T-202.04
PFairfield Inn
LVacation:Lodging
^
D1/15'2009
T-83.30
PGreen Mountain Diapers
LBaby Stuff:Diapers
^
D1/20'2009
T-23.24
PTarget
LBaby Stuff
SBaby Stuff
$-4.19
SFood:Groceries
$-5.00
SPersonal Care
$-11.33
S
$-2.72
^
D1/20'2009
T-24.98
PMotherhood Maternity
LClothing:Maternity
^
D1/22'2009
M$1.759/gal
T-19.00
PHess Express
LAutomobile:Gasoline
^
D1/24'2009
M$1.659/gal
T-11.75
PPrime
LAutomobile:Gasoline
^
D1/24'2009
MA,J&J
T-41.20
P99 Restaurant
LFood:Dining Out
^
D1/25'2009
MFurniture
T-209.69
PWalmart
LBaby Stuff
^
D1/26'2009
T-14.98
PAmazon.com
LPersonal Care:Shaving Supplies
^
D1/31'2009
T-45.75
PJiffy Lube - Billerica
LAutomobile:Oil Change
SAutomobile:Oil Change
$-28.96
SAutomobile
$-16.79
^
D2/7'2009
T-5.88
PBorders
LEducation:Books
^
D2/10'2009
M$1.879/gal
T-28.00
PCarli Convenience
LAutomobile:Gasoline
^
D2/12'2009
T-95.19
PTarget
LFood:Groceries
SFood:Groceries
$-7.17
SGifts
$-4.54
SClothing
$-20.45
SMiscellaneous:Batteries
$-3.98
SHousehold
$-5.48
SPersonal Care:Makeup
$-13.62
SHouse:Kitchen Stuff
$-20.99
SHouse:Storage
$-5.23
SBaby Stuff:Toys
$-2.07
SGifts:Card
$-11.66
^
D2/12'2009
T-29.25
PWalmart
LHouse:Storage
SHouse:Storage
$-7.71
SHouse:Kitchen Stuff
$-5.22
SAutomobile:Wipers
$-8.89
SFood:Groceries
$-7.43
^
D2/13'2009
T1,885.22
L[MIT EFCU Share Draft]
^
D2/14'2009
M$1.859/gal
T-21.00
PCumberland Farms
LAutomobile:Gasoline
^
D2/14'2009
T-17.84
PThe Flower Outlet
LGifts:Flowers
^
D2/16'2009
T-42.46
PH&R Block Digital Tax Solutions
LComputer:Software
^
D2/16'2009
MButton Batteries for Toys/Books
T-28.94
PAmazon.com
LMiscellaneous:Batteries
^
D2/17'2009
T-59.84
POffice Max
LMiscellaneous:Printer Ink
^
D2/18'2009
T-12.41
PJo-Ann Fabric
LHousehold
^
D2/22'2009
MKerosene $3.259/gal
T-18.66
PCommonwealth Oil
LBills:Heat
^
D2/23'2009
T-353.33
PChapman Fuel
LBills:Heat
^
D2/25'2009
T-305.90
PChapman Fuel
LReimbursable:Mom
^
D2/26'2009
T10.49
PTarget
LGifts:Christmas
^
D2/26'2009
T-90.67
PTarget
LBaby Stuff:Utensils
SBaby Stuff:Utensils
$-10.38
SBaby Stuff:Childproofing
$-4.49
SBaby Stuff:Clothing
$-7.45
SHouse:Cleaning
ETide
$-17.99
SClothing:Maternity
$-39.98
SPersonal Care:Vitamins
$-7.99
SHouse:Storage
ESealable food boxes
$-2.39
^
D2/26'2009
T-37.90
PToys 'R' Us
LGifts:Baby
SGifts:Baby
$-19.99
SBaby Stuff:Childproofing
$-7.99
SBaby Stuff
$-9.92
^
D2/26'2009
M$1.869/gal
T-26.00
PISRM Corp
LAutomobile:Gasoline
^
D3/4'2009
M$1.859/gal
T-18.00
PHess Express
LAutomobile:Gasoline
^
D3/13'2009
T701.84
L[MIT EFCU Share Draft]
^
D3/14'2009
M$1.799/gal
T-15.00
PCumberland Farms
LAutomobile:Gasoline
^
D3/14'2009
T-26.10
PKMart
LBaby Stuff:Utensils
SBaby Stuff:Utensils
ECups
$-5.24
SClothing
$-6.17
SFood:Groceries
EYogurt things for Joe
$-2.99
SPersonal Care:Toilet Paper
$-11.70
^
D3/18'2009
T-50.34
PMichaels Crafts
LHousehold:Decorations
SHousehold:Decorations
$-43.36
SGifts:Easter
EJoe
$-6.98
^
D3/18'2009
T-12.10
PPost Office
LMiscellaneous:Postage
^
D3/21'2009
T-33.63
PBuilding 19 1/2
LCharitable Donation
SCharitable Donation
$-23.18
SMiscellaneous:Books
$-4.18
SHobbies-Leisure:Toys & Games
ESoccer Ball
$-3.77
SHouse:Supplies
EOffice Stuff
$-2.50
^
D3/28'2009
T-9.68
PWalmart
LHousehold:Pictures
^
D3/28'2009
T-80.12
PMarket Basket
LFood:Groceries
^
D3/30'2009
M$1.879/gal
T-20.00
PPrime
LAutomobile:Gasoline
^
D4/1'2009
MDriveway Net
T-71.36
PSafe Beginnings
LBaby Stuff:Childproofing
^
D4/4'2009
T-18.39
PShaws
LFood:Groceries
^
D4/6'2009
T-100.00
PCatholic Answers
LCharitable Donation
^
D4/6'2009
T-59.97
PAmazon.com
LPersonal Care:Shaving Supplies
^
D4/9'2009
T-89.14
PWalmart
LFood:Groceries
SFood:Groceries
EWater
$-3.68
SHouse:Kitchen Stuff
ETowels
$-7.35
SHouse:Appliances
EHandheld Vac
$-40.81
SClothing
$-5.00
SHousehold:Decorations
EPicture Hooks
$-4.13
SPersonal Care:Shampoo
$-5.97
SPersonal Care:Misc
$-3.93
SHouse:Storage
$-18.27
^
D4/9'2009
M$1.849/gal
T-27.00
PHess Express
LAutomobile:Gasoline
^
D4/11'2009
T-12.77
PCVS
LFood:Candy
^
D4/13'2009
T958.48
L[MIT EFCU Share Draft]
^
D4/14'2009
T-12.89
PCVS
LHealthcare:Allergy Medicine
SHealthcare:Allergy Medicine
$-10.28
SPersonal Care:Misc
$-2.61
^
D4/16'2009
T-9.85
PBed Bath & Beyond
LHouse:Kitchen Stuff
^
D4/16'2009
T-42.98
PMotherhood Maternity
LClothing:Maternity
^
D4/16'2009
T-25.96
PSears
LClothing:Misc
^
D4/18'2009
M$1.919/gal
T-21.50
PPrime
LAutomobile:Gasoline
^
D4/18'2009
T-7.00
PMt. Auburn Hospital
LMiscellaneous:Parking
^
D4/18'2009
T-6.15
PWalmart
LHousehold:Pictures
^
D4/20'2009
T-336.41
PChapman Fuel
LBills:Heat
^
D4/20'2009
T-19.93
POffice Max
LHome Improvement:Office
^
D4/20'2009
T-34.57
PMarket Basket
LFood:Groceries
^
D4/25'2009
T-39.57
PO'Connor True Value
LHousehold
SHousehold
EStool
$-15.74
SHome Improvement:Insulation
EPipe Insulation
$-5.76
SHousehold:Decorations
EFlag Pole
$-12.59
SHousehold:Decorations
EFence
$-10.48
SCoupon
$5.00
^
D4/25'2009
T-31.18
PO'Connor True Value
LHousehold:Decorations
SHousehold:Decorations
EFlag Bracket
$-5.24
SHome Improvement:Misc
ELock for Sliding Door
$-8.91
SHouse:Grill
EGrill Cover
$-15.74
SHouse:Garden
EBarck Mulch
$-6.29
SCoupon
$5.00
^
D4/25'2009
MGrill Cover
T-26.25
PO'Connor True Value
LHouse:Grill
^
D4/25'2009
MGlass & caulk
T-12.69
PO'Connor True Value
LHome Improvement:Basement
^
D4/27'2009
T-60.00
PWorld Vision
LCharitable Donation
^
D4/30'2009
T-57.15
PWalmart
LFood:Groceries
SFood:Groceries
$-6.64
SHouse:Laundry
EBasket
$-6.30
SHouse:Kitchen Stuff
EIce Pack
$-1.23
SPersonal Care:Soap
$-1.02
S
ECOMPL PWD 75
$-6.27
SPersonal Care:Toothpaste
$-3.02
SBaby Stuff:Clothing
$-6.00
SHealthcare:Headache
$-4.20
SPersonal Care:Misc
EBath Pouf
$-1.05
SHouse:Cleaning
$-4.73
S
E3PK CHRY BNS
$-2.88
SHouse:Kitchen Stuff
ESkewers
$-1.02
SPersonal Care:Misc
$-2.27
SBaby Stuff:Clothing
EShoes
$-6.50
S
EPLATE RACK
$-4.02
^
D5/2'2009
M$1.959/gal
T-16.50
PPrime
LAutomobile:Gasoline
^
D5/5'2009
MCircuit Breakers
T-22.28
PO'Connor True Value
LHome Improvement:Electrical
^
D5/5'2009
T-90.10
PRoche Brothers
LFood:Groceries
^
D5/7'2009
T-50.73
PBabies R Us
LHousehold:Sheets
SHousehold:Sheets
$-16.13
SClothing:Maternity
ESupport Belt
$-34.60
^
D5/9'2009
T-90.02
PMarket Basket
LFood:Groceries
^
D5/13'2009
T1,005.67
L[MIT EFCU Share Draft]
^
D5/14'2009
T-69.94
PMotherhood Maternity
LClothing:Maternity
^
D5/14'2009
M$2.219/gal
T-33.00
PHess Express
LAutomobile:Gasoline
^
D5/14'2009
T25.96
PSears
LClothing:Misc
^
D5/14'2009
T-37.97
PSears
LClothing:Misc
^
D5/14'2009
T-72.19
PTexas Roadhouse
LFood:Dining Out
^
D5/15'2009
T10.53
PWalmart
LBaby Stuff:Clothing
SBaby Stuff:Clothing
EShoes
$6.50
S
EPlate Rack
$4.03
^
D5/15'2009
T5.10
PWalmart
LHousehold:Pictures
^
D5/15'2009
T-79.84
PWalmart
LHouse:Storage
SHouse:Storage
$-21.00
SHealthcare:Allergy Medicine
$-13.99
SHouse:Cleaning
$-2.92
S
ECOMPL PWD 75
$-6.27
SBaby Stuff:Childproofing
$-5.25
SBaby Stuff:Wipes
$-1.05
SBaby Stuff:Clothing
EShoes
$-9.00
SPersonal Care:Misc
$-2.39
SBaby Stuff:Diapers
$-19.97
SCoupon
$2.00
^
D5/16'2009
T-54.15
PPost Office
LMiscellaneous:Postage
^
D5/18'2009
T-154.70
PRoche Brothers
LFood:Groceries
^
D5/20'2009
M$2.299/gal
T-25.25
PHess Express
LAutomobile:Gasoline
^
D5/21'2009
T-37.50
PJC Penny
LClothing:Maternity
^
D5/22'2009
T-55.84
PTarget
LBaby Stuff:Misc
SBaby Stuff:Misc
$-4.19
SHouse:Storage
$-13.63
SHouse:Kitchen Stuff
EDutch Oven
$-31.49
S
E2PCK UTILITY (2@2.99)
$-6.28
S
EUP FACIAL
$-1.04
SCoupon
$0.79
^
D5/27'2009
T-43.28
PChilis
LFood:Dining Out
^
D5/27'2009
M$2.339/gal
T-34.00
PHess Express
LAutomobile:Gasoline
^
D5/28'2009
MChristening Gown
T-12.00
PJC Penny
LBaby Stuff:Clothing
^
D5/29'2009
T-16.79
PPapa Ginos
LFood:Dining Out
^
D6/2'2009
T-30.95
PCVS
LHealthcare:Allergy Medicine
SHealthcare:Allergy Medicine
$-19.94
SPersonal Care:Vitamins
EFlax Seed Oil
$-11.01
^
D6/6'2009
T-46.51
PO'Connor True Value
LBaby Stuff:Babyproofing
SBaby Stuff:Babyproofing
ELocks
$-51.51
SCoupon
$5.00
^
D6/7'2009
T-20.34
PPapa Ginos
LFood:Dining Out
^
D6/8'2009
T-182.81
PTarget
LBaby Stuff:Diapers
SBaby Stuff:Diapers
$-21.65
SBaby Stuff:Formula
$-11.99
SFood:Groceries
EBaby Food
$-5.08
SBaby Stuff:Clothing
$-9.00
SClothing:Maternity
$-48.97
SPersonal Care:Shampoo
$-1.77
SHouse:Storage
$-19.55
SHouse:Bedroom Stuff
$-57.73
S
EUP FD STRG
$-2.30
SHouse:Storage
EMagazine Racks
$-4.77
^
D6/8'2009
M$2.499/gal
T-25.75
PHess Express
LAutomobile:Gasoline
^
D6/8'2009
T-28.95
PCCLI
LMiscellaneous:Books
^
D6/10'2009
T-13.62
PMichaels Crafts
LHousehold:Decorations
SHousehold:Decorations
$-7.33
SBaby Stuff:Misc
EHand Print Kit
$-6.29
^
D6/11'2009
MCatholic Mom's Forum Support- 5603-2276-0066-1168
T-20.00
PYuku
^
D6/11'2009
T-100.00
PCatholic Answers
LCharitable Donation
^
D6/13'2009
M$2.519/gal
T-35.00
PPrime
LAutomobile:Gasoline
^
D6/13'2009
T981.92
L[MIT EFCU Share Draft]
^
D6/14'2009
T-35.93
PIHOP
LFood:Dining Out
^
D6/17'2009
T-15.01
PIParty
LMiscellaneous:Party Supplies
^
D6/17'2009
MBrakes
T-560.20
PHerb Chambers Honda
LAutomobile:Maintenance
^
D6/19'2009
T-24.93
PO'Connor True Value
LHouse:Lightbulbs
SHouse:Lightbulbs
$-9.43
SHome Improvement:Electrical
EExtension Cord
$-5.24
SHouse
EClothesline, Rubber Feet
$-10.26
^
D6/20'2009
T-78.19
PBabies R Us
LFood:Groceries
SFood:Groceries
$-5.00
SBaby Stuff
ECarters Baby Boy RB
$-26.24
SBaby Stuff:Clothing
EChristening Gown
$-4.99
SBaby Stuff
ELt Blue Knitsheet (2)
$-16.78
SBaby Stuff:Misc
E2 Pk LG Multi Pad
$-15.74
SBaby Stuff:Misc
EBAPF 18 CD Sestable Toppers
$-9.44
^
D6/20'2009
T-28.77
PTarget
LBaby Stuff:Wipes
SBaby Stuff:Wipes
$-2.04
SMiscellaneous:Dishwasher Detergent
$-11.74
SClothing:Maternity
$-14.99
^
D6/20'2009
T-20.98
POffice Max
LHome Improvement:Office
^
D6/24'2009
T-26.31
PTony Pilla's
LFood:Dining Out
^
D6/25'2009
M$2.599/gal
T-30.00
PHess Express
LAutomobile:Gasoline
^
D6/27'2009
MScrews
T-4.19
PO'Connor True Value
LHouse:Supplies
^
D6/27'2009
MLynette
T-50.00
PO'Connor True Value
LGifts:Birthday
^
D7/2'2009
M$2.539/gal
T-36.50
PPrime
LAutomobile:Gasoline
^
D7/2'2009
T-25.00
PMt. Auburn Hospital
LMiscellaneous:Parking
^
D7/8'2009
T-65.94
PRoche Brothers
LFood:Groceries
^
D7/8'2009
T-78.75
PAPC
LComputer:UPS
^
D7/8'2009
T-5.00
PMt. Auburn Hospital
LMiscellaneous:Parking
^
D7/10'2009
T-17.84
PPapa Ginos
LFood:Dining Out
^
D7/10'2009
T-13.38
PCVS
LFood:Candy
SFood:Candy
$-5.00
SPersonal Care:Misc
$-8.38
^
D7/11'2009
T-76.64
PO'Connor True Value
LHome Improvement:Basement
SHome Improvement:Basement
$-15.74
SHouse:Locks
$-12.60
SHouse:Electrical
EPower Strip
$-7.86
SHome Improvement:Misc
ECaps for Windows
$-1.35
SHome Improvement:Garage
ESprings
$-44.08
SCoupon
$4.99
^
D7/11'2009
T-29.62
PMarket Basket
LFood:Groceries
^
D7/13'2009
T1,467.35
L[MIT EFCU Share Draft]
^
D7/14'2009
T3.68
PO'Connor True Value
LHome Improvement:Electrical
^
D7/15'2009
T-44.85
PO'Connor True Value
LElectrical:Wire
SElectrical:Wire
E12/3 50'
$-47.24
SHome Improvement:Misc
EPlunger
$-2.61
SCoupon
$5.00
^
D7/16'2009
T-84.97
PRoche Brothers
LFood:Groceries
^
D7/17'2009
T-45.96
PKMart
LBaby Stuff:Utensils
SBaby Stuff:Utensils
$-16.78
SPersonal Care:Misc
$-4.00
SAutomobile:Misc
EBelt Conditioner
$-4.19
SBaby Stuff:Diapers
$-20.99
^
D7/18'2009
T-17.06
PMarket Basket
LFood:Groceries
SFood:Groceries
$-8.77
SGifts:Card
$-8.29
^
D7/18'2009
T-27.55
P99 Restaurant
LFood:Dining Out
^
D7/19'2009
M$2.499/gal
T-40.00
PHess Express
LAutomobile:Gasoline
^
D7/20'2009
T-49.80
PGreen Mountain Diapers
LBaby Stuff:Diapers
^
D7/23'2009
T-78.67
PRoche Brothers
LFood:Groceries
^
D7/24'2009
T-54.82
PKMart
LPersonal Care
SPersonal Care
EIE CTTN RNDS
$-1.88
SClothing
EMIX 'N MATCH (3)
$-7.50
SClothing
EBOYS LWCUTS
$-6.99
SPersonal Care:Misc
EKOTEX 80CT
$-5.00
SMiscellaneous
EBLMOIN4OZ
$-5.55
SPersonal Care:Misc
EAF CALAMINE
$-2.72
SPersonal Care:Shampoo
EFRUCTIS STYL
$-4.19
SBaby Stuff:Diapers
EPMP SWADD BP
$-20.99
^
D7/24'2009
T-50.77
PMarket Basket
LFood:Groceries
^
D7/25'2009
M$2.479/gal
T-22.00
PHess Express
LAutomobile:Gasoline
^
D7/25'2009
T-133.50
PCarson Wrapped Hershey's
LBaby Stuff
^
D7/31'2009
M4 1TB hard drives, two external
T-379.74
PNewEgg
LComputer:Hard Drive
^
D7/31'2009
T-31.26
PCVS
LHealthcare:Allergy Medicine
SHealthcare:Allergy Medicine
$-10.28
SPersonal Care:Vitamins
$-22.04
SPersonal Care:Misc
$-4.19
SCoupon
$5.25
^
D8/1'2009
T-22.28
PO'Connor True Value
LHome Improvement:Plumbing
SHome Improvement:Plumbing
EFaucet Washers
$-11.67
SAutomobile:Misc
EMetallic tape for Exhaust
$-10.61
^
D8/3'2009
T-32.47
PIParty
LMiscellaneous:Party Supplies
^
D8/4'2009
MExhaust System
T-486.93
PMidas
LAutomobile:Repair
^
D8/6'2009
M$2.559/gal
T-21.25
PHess Express
LAutomobile:Gasoline
^
D8/8'2009
T-69.79
PMarket Basket
LFood:Groceries
^
D8/9'2009
T-171.75
P99 Restaurant
LFood:Dining Out
^
D8/9'2009
T-85.32
PStop & Shop
LFood:Groceries
SFood:Groceries
$-2.10
SFood:Lunch
$-10.00
^
D8/10'2009
T-26.00
PConsumer Reports
LBills:Magazine
^
D8/12'2009
M12 Issues/Christopher
T-18.00
PPopular Mechanics
LGifts
^
D8/12'2009
T-15.97
PPopular Mechanics
LBills:Magazine
^
D8/13'2009
T765.68
L[MIT EFCU Share Draft]
^
D8/23'2009
T46.97
PTarget
LClothing:Maternity
^
D8/23'2009
T-68.20
PTarget
LBaby Stuff:Diapers
SBaby Stuff:Diapers
EPampers
$-18.99
SFood:Groceries
EGerber FF, 2ND, GRADS
$-8.99
SClothing:Misc
ESILKEN MIST, MENS 10PK
$-10.03
SPersonal Care:Misc
EUP Saline
$-2.65
SHouse:Storage
EBLUE FABRIC
$-11.69
SHouse:Kitchen Stuff
ESINK BRUSH
$-6.36
SHouse:Kitchen Stuff
EBounty Basic
$-5.83
SPersonal Care:Makeup
ETGT HEMO CRE
$-3.66
^
D8/28'2009
M$2.499/gal
T-27.00
PPrime
LAutomobile:Gasoline
^
D8/29'2009
T-7.41
PCVS
LBaby Stuff:Toys
^
D9/1'2009
T-23.13
PO'Connor True Value
LBaby Stuff:Misc
SBaby Stuff:Misc
EPotty Pail Tray
$-2.39
SHouse:Electrical
EFlourescent Light Fixture
$-31.65
SCoupon
$10.92
^
D9/1'2009
M$2.679/gal (Blue Car Partial)
T-15.00
PCarli Convenience
LAutomobile:Gasoline
^
D9/7'2009
M$2.519/gal
T-35.00
PPrime
LAutomobile:Gasoline
^
D9/12'2009
T-66.56
PTarget
LBaby Stuff:Misc
SBaby Stuff:Misc
EDiaper Rash, Mirror
$-22.28
SAutomobile:Wipers
$-19.85
SHouse:Storage
$-24.43
^
D9/12'2009
T-50.44
PWalmart
LPersonal Care:Misc
SPersonal Care:Misc
$-5.28
SAutomobile:Misc
EBaby M irror
$-15.94
SBaby Stuff:Toys
ECraft Sticks
$-4.22
SClothing:Shoes
$-9.00
SClothing:Jeans
$-16.00
^
D9/12'2009
T-39.26
PAmazon.com
LMiscellaneous:Thermometer
SMiscellaneous:Thermometer
$-14.99
SBaby Stuff:Misc
EDiaper Pail Liner
$-24.50
SCoupon
EGift Cert. Balance
$0.23
^
D9/13'2009
T1,721.75
L[MIT EFCU Share Draft]
^
D9/18'2009
M$2.559/gal
T-30.00
PHess Express
LAutomobile:Gasoline
^
D9/19'2009
T-91.92
PO'Connor True Value
LHouse:Electrical
SHouse:Electrical
EFlourescent Light Fixtures
$-63.93
SHouse:Electrical
ELED light fixture
$-21.31
SHouse:Lightbulbs
E4' Flourescent
$-3.19
SAutomobile:Misc
ECarb Cleaner
$-4.57
SHome Improvement:Bathroom
ECaulking
$-4.24
SCoupon
$5.32
^
D9/19'2009
T-75.87
PJiffy Lube - Billerica
LAutomobile:Oil Change
SAutomobile:Oil Change
ECivic
$-36.91
SAutomobile:Maintenance
ETransmission Fluid
$-46.14
SCoupon
$7.18
^
D9/26'2009
T-54.00
POur Sunday Visitor
LEducation:Religious
^
D9/26'2009
MJennifer
T-104.55
PKohls
LClothing:Misc
^
D9/30'2009
T-66.90
PSears
LHousehold:Pictures
^
D10/5'2009
T66.90
PSears
LHousehold:Pictures
^
D10/5'2009
T-90.94
PMarket Basket
LFood:Groceries
^
D10/5'2009
T-35.63
PSears
LHousehold:Pictures
^
D10/10'2009
T-83.93
PMarket Basket
LFood:Groceries
^
D10/12'2009
M$2.359/gal
T-34.00
PCumberland Farms
LAutomobile:Gasoline
^
D10/12'2009
MDiaper Rash, Mirror
T-15.93
PTarget
LBaby Stuff:Misc
^
D10/12'2009
T-27.51
PTarget
LHouse:Cleaning
^
D10/13'2009
M$2.399/gal
T-26.00
PPrime
LAutomobile:Gasoline
^
D10/14'2009
T461.59
L[MIT EFCU Share Draft]
^
D10/15'2009
T-50.00
PRegistry of Motor Vehicles
LAutomobile:License Renewal
^
D10/17'2009
T-173.35
PJiffy Lube - Billerica
LAutomobile:Oil Change
SAutomobile:Oil Change
EAccord
$-36.92
SAutomobile:Maintenance
ETransmission Fluid
$-123.10
SAutomobile:Misc
EAir Filter
$-35.90
SCoupon
$22.57
^
D11/3'2009
T-15.00
PCatholic Answers
LCharitable Donation
^
D11/4'2009
M$2.599/gal
T-30.00
PPrime
LAutomobile:Gasoline
^
D11/7'2009
T-14.85
POffice Max
LHouse:Storage
^
D11/7'2009
MFrames
T-7.31
PMichaels Crafts
LHousehold:Decorations
^
D11/11'2009
T-21.48
PPayless Shoe Source
LClothing:Shoes
^
D11/13'2009
T663.98
L[MIT EFCU Share Draft]
^
D11/17'2009
T-32.11
PMarket Basket
LFood:Groceries
^
D11/22'2009
T-70.33
PWalmart
LFood:Groceries
SFood:Groceries
$-29.66
SBaby Stuff:Diapers
$-30.32
SHealthcare:Medicine
ETylenol for Dan
$-8.30
SPersonal Care:Misc
$-2.05
^
D11/25'2009
T-34.30
PPerkins
LFood:Dining Out
^
D11/25'2009
T-43.29
PTarget
LFood:Groceries
SFood:Groceries
$-6.14
SGifts
EMicrophone
$-10.96
SPersonal Care:Shaving Supplies
$-23.09
SPersonal Care:Deodorant
$-1.02
SPersonal Care:Misc
$-2.08
^
D11/27'2009
T-33.08
PTarget
LFood:Groceries
SFood:Groceries
$-19.66
SBaby Stuff:Diapers
$-9.48
SBaby Stuff:Wipes
$-1.87
SPersonal Care:Shampoo
$-1.02
SPersonal Care:Misc
$-1.05
^
D11/28'2009
M$2.699/gal
T-31.80
PCenex
LAutomobile:Gasoline
^
D11/28'2009
T-23.70
PTarget
LFood:Groceries
^
D12/1'2009
M$2.579 MKE
T-32.50
PBP
LAutomobile:Gasoline
^
D12/1'2009
T-405.01
PHertz - Milwaukee
LVacation:Car Rental
^
D12/1'2009
T-81.71
PComfort Inn - Beloit
LVacation:Lodging
^
D12/4'2009
M$2.539/gal
T-39.00
PCumberland Farms
LAutomobile:Gasoline
^
D12/9'2009
M$2.599/gal
T-28.00
PHess Express
LAutomobile:Gasoline
^
D12/11'2009
T-34.42
PAmazon.com
LGifts:Christmas
^
D12/11'2009
T-35.97
PAmazon.com
LGifts:Christmas
^
D12/12'2009
T-86.00
PToys 'R' Us
LCharitable Donation
SCharitable Donation
$-32.92
SGifts:Birthday
$-12.28
SGifts:Christmas
$-40.80
^
D12/12'2009
T-148.19
PTarget
LBaby Stuff:Wipes
SBaby Stuff:Wipes
$-1.53
SBaby Stuff:Misc
EBalmex (2)
$-8.48
SGifts:Christmas
EInfant Toy (2)
$-12.68
SMiscellaneous:Batteries
EKitchen Timer
$-4.40
SFood:Candy
$-5.98
SHouse:Kitchen Stuff
ESpatula
$-2.11
SPersonal Care:Tissue
$-4.24
SMiscellaneous:Christmas
ECards (2)
$-5.31
SGifts:Christmas
ERC Car, Perfect Catch, Recorder
$-19.09
SHouse:Cleaning
EShark Steam Cleaner
$-84.37
^
D12/14'2009
MDISCOVER E-PAYMENT 091213
T191.08
L[MIT EFCU Share Draft]
^
D12/15'2009
T-15.00
PCatholic Answers
LCharitable Donation
^
D12/16'2009
T6.49
PPayless Shoe Source
LClothing:Shoes
^
D12/16'2009
T-58.17
PKMart
LGifts:Christmas
SGifts:Christmas
$-25.47
SHouse:Storage
$-25.44
SPersonal Care:Misc
ECover Stick (?)
$-6.26
SFood:Candy
EChoc Soldier
$-1.00
^
D12/16'2009
T-33.63
PO'Connor True Value
LMiscellaneous
SMiscellaneous
EGrabber
$-20.46
SHousehold:Decorations
EFoot switch for lights
$-5.32
SHome Improvement:Misc
EBrackets
$-7.85
^
D12/20'2009
T-27.32
PAmazon.com
LGifts:Christmas
^
D12/23'2009
T-19.15
PStop & Shop
LFood:Groceries
SFood:Groceries
$-7.15
SFood:Lunch
$-12.00
^
D12/24'2009
T-16.00
PConsumer Reports
LGifts:Christmas
^
D12/26'2009
M$2.539/gal
T-46.30
PPrime
LAutomobile:Gasoline
^
D12/31'2009
M$2.539/gal
T-27.00
PPrime
LAutomobile:Gasoline
^
D12/31'2009
T-18.19
PBickfords Grill
LFood:Dining Out
^
D1/9'2010
T-237.43
PTarget
LBaby Stuff
SBaby Stuff
ECar Seat
$-119.99
SHouse:Cleaning
$-1.97
SBaby Stuff:Clothing
ESneakers
$-17.99
SComputer:Printer
$-59.99
SPersonal Care
EHair dryer
$-14.99
SHouse:Storage
$-32.50
S
EGift Card
$10.00
^
D1/9'2010
T-15.98
PMotherhood Maternity
LClothing
^
D1/11'2010
T-55.30
PTarget
LBaby Stuff:Wipes
SBaby Stuff:Wipes
$-2.70
SPersonal Care:Misc
$-6.78
SPersonal Care:Shaving Supplies
$-14.12
SMiscellaneous
E2 pk 20 oz
$-5.83
SMiscellaneous
E14 oz bottle
$-2.11
SPersonal Care:Tissue
EUp Facial
$-1.05
SHealthcare:Medicine
E150Ct Tums
$-3.92
SPersonal Care:Contact Solution
EClear Care
$-14.54
SPersonal Care:Contact Solution
Erenu
$-4.25
^
D1/11'2010
MNew Razor
T-54.99
PAmazon.com
LPersonal Care:Shaving Supplies
^
D1/13'2010
T1,184.60
L[MIT EFCU Share Draft]
^
D1/15'2010
MHaiti
T-100.00
PFood for the Poor
LCharitable Donation
^
D1/18'2010
T-15.00
PCatholic Answers
LCharitable Donation
^
D1/22'2010
M$2.679/gal
T-38.60
PHess Express
LAutomobile:Gasoline
^
D1/23'2010
MCivic Renewal  Transaction ID is: 02490105
T-50.00
PRegistry of Motor Vehicles
LAutomobile:Registration
^
D1/23'2010
M$2.619/gal
T-29.50
PPrime
LAutomobile:Gasoline
^
D1/23'2010
T-45.74
PApplebees
LFood:Dining Out
^
D1/25'2010
T-27.90
PWalmart
LBaby Stuff:Utensils
SBaby Stuff:Utensils
$-3.15
SBaby Stuff:Bibs
$-12.00
SBaby Stuff:Misc
EPotty
$-12.75
^
D1/27'2010
MWaterproofing
T-5.30
PPayless Shoe Source
LClothing:Shoes
^
D2/6'2010
T-30.39
PKMart
LPersonal Care:Shampoo
SPersonal Care:Shampoo
$-6.77
SPersonal Care:Misc
EAF Lotion
$-4.88
SClothing:Misc
EPanty Hose
$-3.99
SHealthcare:Misc
EBandages
$-3.03
SFood:Candy
$-6.25
SHealthcare:Misc
EAF Antibiotic
$-5.47
^
D2/8'2010
T-10.00
PBurlington Car Wash
LAutomobile:Car Wash
^
D2/13'2010
T605.34
L[MIT EFCU Share Draft]
^
D2/15'2010
T-15.00
PCatholic Answers
LCharitable Donation
^
D2/20'2010
MJennifer
T-45.98
PKohls
LClothing:Pants
^
D2/20'2010
T-71.20
PThe Body Shop
LPersonal Care:Misc
^
D2/20'2010
MCrafts
T-4.18
PMichaels Crafts
LHobbies-Leisure:Toys & Games
^
D2/20'2010
T-15.98
PMotherhood Maternity
LClothing
^
D2/24'2010
T-90.48
PMarket Basket
LFood:Groceries
SFood:Groceries
$-71.72
SCharitable Donation
$-18.76
^
D3/5'2010
M$2.639/gal
T-28.00
PHess Express
LAutomobile:Gasoline
^
D3/6'2010
T-31.83
PH&R Block Digital Tax Solutions
LTax Preparation
^
D3/8'2010
T-45.85
PGreen Mountain Diapers
LBaby Stuff:Diapers
^
D3/10'2010
T-171.83
PMarket Basket
LFood:Groceries
^
D3/11'2010
M$2.659/gal
T-37.10
PHess Express
LAutomobile:Gasoline
^
D3/12'2010
MStephen
T-25.87
PAmazon.com
LGifts:Birthday
^
D3/13'2010
T389.77
L[MIT EFCU Share Draft]
^
D3/15'2010
T-15.00
PCatholic Answers
LCharitable Donation
^
D3/17'2010
T-71.97
PMarket Basket
LFood:Groceries
^
D3/19'2010
MAccord
T-50.00
PRegistry of Motor Vehicles
LAutomobile:Registration
^
D3/20'2010
T-51.05
PKMart
LGifts:Birthday
SGifts:Birthday
EAshley & Emily
$-4.23
SHouse:Storage
$-16.96
SClothing:Sunglasses
EJoe
$-4.99
SBaby Stuff:Utensils
ECups for Dan
$-8.49
SClothing
ERonell Navy
$-12.99
SPersonal Care:Toothpaste
EJoe
$-3.39
^
D3/25'2010
T-171.68
PMarket Basket
LFood:Groceries
SFood:Groceries
$-148.82
SCharitable Donation
$-22.86
^
D3/31'2010
M$2.699/gal
T-38.50
PHess Express
LAutomobile:Gasoline
^
D4/1'2010
T-116.41
PKMart
LGifts:Easter
SGifts:Easter
$-14.09
SHouse:Outdoors
EChairs
$-72.23
SMiscellaneous:Batteries
$-4.45
SPersonal Care:Shampoo
E& Conditioner
$-4.44
S
EI Spy Little
$-7.43
S
EMirror
$-1.16
S
EPMP BD JMBO
$-10.61
SFood:Candy
$-2.00
^
D4/1'2010
T-93.12
PMarket Basket
LFood:Groceries
^
D4/8'2010
T-93.95
PMarket Basket
LFood:Groceries
^
D4/9'2010
T-25.98
PMotherhood Maternity
LClothing
^
D4/13'2010
T568.98
L[MIT EFCU Share Draft]
^
D4/17'2010
M$2.799/gal
T-41.00
PMobil
LAutomobile:Gasoline
^
D4/18'2010
M$2.729/gal
T-50.75
PCumberland Farms
LAutomobile:Gasoline
^
D4/20'2010
T-15.00
PCatholic Answers
LCharitable Donation
^
D4/26'2010
T-50.00
PTea Party Express
LPolitical Contribution
^
D4/30'2010
T-75.00
PHabitat for Humanity
LCharitable Donation
^
D4/30'2010
T-75.00
PBoston Rescue Mission
LCharitable Donation
^
D4/30'2010
T-100.00
PFood for the Poor
LCharitable Donation
^
D5/1'2010
T-103.66
PTarget
LBaby Stuff:Misc
SBaby Stuff:Misc
$-5.96
SFood:Groceries
$-54.18
SBaby Stuff:Toys
EStools
$-16.34
SHouse:Laundry
EDetergent
$-9.02
SPersonal Care:Shampoo
$-3.18
SPersonal Care:Misc
EChapstick 3C
$-3.18
SHouse:Storage
ESmall Basket
$-6.36
SPersonal Care:Tissue
$-1.05
SHealthcare:Eyecare
EEye Drops
$-3.39
SHouse:Kitchen Stuff
EIce Pack
$-1.00
^
D5/5'2010
T-121.69
PAmazon.com
LEducation:Religious
SEducation:Religious
$-19.77
SPersonal Care:Shaving Supplies
$-39.98
SPersonal Care:Misc
EHair Cape
$-8.95
SBills:Cable Modem
EActual cable modem
$-52.99
^
D5/6'2010
MChristopher
T-31.86
PMacys - Burlington
LGifts:Birthday
^
D5/7'2010
M$2.799/gal
T-45.50
PPrime
LAutomobile:Gasoline
^
D5/13'2010
T696.39
L[MIT EFCU Share Draft]
^
D5/15'2010
T-81.34
PKMart
LBaby Stuff:Misc
SBaby Stuff:Misc
EChanging Pad/Cover
$-30.60
SBaby Stuff:Clothing
EWK Essential
$-7.98
SHousehold:Decorations
EFlowers
$-21.23
SHouse:Kitchen Stuff
EDble Sink Ru
$-13.54
SBaby Stuff:Diapers
ESwim Diapers
$-7.99
^
D5/17'2010
T-15.00
PCatholic Answers
LCharitable Donation
^
D5/22'2010
MPassport
T-56.41
PWalmart
LHousehold:Decorations
SHousehold:Decorations
EStreamer
$-1.33
SFood:Groceries
$-2.88
SMiscellaneous:Dishwasher Detergent
$-6.87
SPersonal Care:Misc
EHaricut Kit
$-29.39
SMiscellaneous
ECooler
$-15.94
^
D5/22'2010
M$2.639/gal
T-34.50
PPrime
LAutomobile:Gasoline
^
D5/25'2010
M$2.619/gal
T-39.50
PPrime
LAutomobile:Gasoline
^
D5/26'2010
M$2.739/gal  Loganton, PA
T-49.00
PValero
LAutomobile:Gasoline
^
D5/27'2010
M$2.649/gal Swanton, OH
T-40.75
PValero
LAutomobile:Gasoline
^
D5/27'2010
T-94.74
PComfort Inn - Lamar, PA
LVacation:Lodging
^
D5/28'2010
T-66.52
PBest Western - Howe, IN
LVacation:Lodging
^
D5/29'2010
M$2.599/gal
T-40.50
PSpeedway
LAutomobile:Gasoline
^
D5/29'2010
T-239.34
PTarget
LBaby Stuff:Wipes
SBaby Stuff:Wipes
$-3.56
SGifts:Card
$-3.15
SHousehold:Decorations
ERibbon
$-3.15
SGifts:Shower
EBoppy + Stroller
$-152.95
SFood:Groceries
$-76.53
^
D5/29'2010
T-61.28
PEcono Lodge - Beloit
LVacation:Lodging
^
D6/2'2010
MKristi
T-23.16
PThe Calico Shoppe
LGifts:Birthday
^
D6/3'2010
T-30.16
PWalmart
LHouse:Storage
SHouse:Storage
EBox
$-5.99
SFood:Groceries
$-24.17
^
D6/7'2010
T-77.84
PCenex
LGifts:Birthday
SGifts:Birthday
ETim
$-75.00
SFood:Dining Out
EFrapachino
$-2.84
^
D6/7'2010
M$2.739/gal
T-46.50
PCenex
LAutomobile:Gasoline
^
D6/7'2010
M$2.559/gal - Beloit
T-21.50
PSpeedway
LAutomobile:Gasoline
^
D6/8'2010
M$2.579/gal Elkhart, IN
T-29.00
PBP
LAutomobile:Gasoline
^
D6/8'2010
T-14.34
PTarget
LHealthcare:Misc
SHealthcare:Misc
EBandaid
$-1.72
SBaby Stuff:Wipes
$-3.41
SFood:Groceries
$-9.21
^
D6/8'2010
T-104.50
PFairfield Inn - Tinley Park
LVacation:Lodging
^
D6/9'2010
M$2.569/gal  Elyria, OH
T-24.00
PSpeedway
LAutomobile:Gasoline
^
D6/9'2010
T-78.52
PBest Western - Elyria, OH
LVacation:Lodging
^
D6/10'2010
T-76.42
PRamada - New Hartford
LVacation:Lodging
^
D6/10'2010
M$2.849/gal  Utica, NY
T-50.00
PHess Express
LAutomobile:Gasoline
^
