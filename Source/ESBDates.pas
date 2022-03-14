unit ESBDates;

{: ESB Date/Time Routines Collection v3.0.1 for Borland Delphi.

	Date/Time Routines to enhance your 32-bit Delphi
	Programming. <p>

	Copyright (c) 1999-2001 ESB Consultancy <p>

	Recommend checking out (included): <p>

	http://www.tondering.dk/claus/calendar.html<p>

	FREQUENTLY ASKED QUESTIONS ABOUT CALENDARS<p>

	Some of our algorithms are based on info from the above. <p>

	ISO-8601 Document (not included) can be obtained as a PDF file from:<p>

	http://www.iso.ch/markete/8601.pdf <p>

	RFC822 Text File (not included) can be obtained from:<p>

	http://info.internet.isi.edu/in-notes/rfc/files/rfc822.txt <p>

	=================================================== <p>

	These routines are used by ESB Consultancy within the
	development of their Customised Application. <p>

	ESB Consultancy retains full copyright. <p>

	ESB Consultancy grants users of this code royalty free rights
	to do with this code as they wish. <p>

	ESB Consultancy makes no guarantees nor excepts any liabilities
	due to the use of these routines. <p>

	We do ask that if this code helps you in you development
	that you send as an email mailto:info@esbconsult.com.au or even
	a local postcard. It would also be nice if you gave us a
	mention in your About Box, Help File or Documentation. <p>

	ESB Consultancy Home Page: http://www.esbconsult.com.au/<p>

	Mail Address: PO Box 2259, Boulder, WA 6449 AUSTRALIA <p>

	For Date and Time Edit Components check out our ESB Professional
	Computation Suite (ESBPCS) - trial versions available now.
	Check out the website at http://www.esbconsult.com.au/esbpcs2/<p>

	History: <p>
	v3.0.1 7-Sep-2001<p>
	- Add GpTimeZone v1.21<p>
	- Improved D2 support<p>
<p>
	v3.0.0 6-Sep-2001<p>
	- Testing is only done for Delphi 4 and above from here on in.<p>
	- Delphi 6 Support added.<p>
	- Heaps more constants added.<p>
	- Optimised Encoding and Decoding of Dates.<p>
	- ResourceStrings now used.<p>
	- Date formatted as an MS Access Style Comparison Added.<p>
	- Date formatted as an ANSI SQL Style Comparison Added.<p>
	- Heaps of Date and Time Conversion Routines added.<p>
	- Added an Enhanced Str2Date Conversion.<p>
	- Add GpTimeZone v1.2<p>
<p>
	v2.2.0 3-Feb-2001<p>
	- Fixed bug with IsAugustNow<p>
<p>
	v2.1.0 6-Oct-2000<p>
	- Add GpTimeZone v1.1b<p>
	- Add Calendar FAQ v2.3<p>
	- Added Calendar Weeks Apart<p>
	- Added Calendar Months Apart<p>
	- Added IsValidLongMonth & IsValidShortMonth Routines<p>
	- Added IsValidLongDOW & IsValidShortDOW Routines<p>
	- Added IsFirstDayOfMonth, IsLastDayofMonth Comparisons<p>
	- Added IsFirstDayOfYear, IsLastDayofYear Comparisons<p>
	- Added ISODateTime2DateTime as suggested by Wolfgang Werner.<p>
	- Fixed TimeApartInSecs - thanks to Mark Lussier.<p>
<p>
	v2.0.0 17-Feb-2000<p>
	- Add GpTimeZone v1.1<p>
	- Added TFileTime / TDateTime Conversions donated by J Peter Mugaas<p>
	- Added DateTimeToLargeInteger donated by Damien Racca<p>
	- Added DT Constants<p>
	- Added TimeApartInXXX routines<p>
	- Added SameDate, SameTime, SameDateTime<p>
	- DOW2Int & Month2Int relpaced by DayName2DOW & MonthName2Month<p>
	- Date to Short Month, Long Month, Short DOW, Long DOW Routines added<p>
	- Added GMTNow, GMTDate, GMTTime to return the current Date/Time info at
		GMT/UTC.<p>
	- Redesigned Help<p>

	v1.8.2 5-Nov-99<p>
	- Calender21.txt included<p>
	- URL's updated<p>

	v1.8.1 24-Oct-99<p>
	- Add GpTimeZone v1.0.1<p>
	- GpTimeZone Demo Project now works with Delphi 3<p>

	v1.8 18-Oct-99<p>
	- Removed Daylight Savings Routines due to bugs and included new unit
		GpTimeZone from Primoz Gabrijelcic. Many thanks also to Chris Means
		for his identification of problems with our routine.<p>

	v1.7 6-September-99<p>
	- D5 Compatibility added<p>
	- Updated Str2Time<p>
	- Redesigned Str2Date - previous version didn't work with all DateFormats<p>
	- Added Elapsing Time donated by Laurent PIERRE<p>

	v1.6 1-August-99<p>
	- Now over 175 Routines<p>
	- Str2Date now allows year to be omitted - assumes current year<p>
	- Str2Date now allows you to decide how 2 Digit Years are to be processed<p>
	- Str2HistoricDate assumes 2 Digit Years are this year or earlier<p>
	- Str2CutoffDate uses a Cutoff Date to control how 2 Digit Years are processed<p>
	- Date2Str more tolerant of returning an empty string
	- Fixed Problem with AddMonths with Negative Months
	- Fixed bug in GetFirstSundayOfYear
	- Age in Months & Weeks Routines donated by David Gobbett - aimed at Hospital Application
	- Added Various ISO-8601 Compliant Week and Formatting routines - thanks to Niklas Astrom
	- Links to ISO-8601 and RFC-822 added

	v1.5 12-July-99<p>
	- Now over 150 Routines<p>
	- Added Subtraction routines for completeness - suggested by Wolfgang Wendefeuer<p>
	- AgeAtDate and AgeNow Routines added<p>
	- Fixed a number of mistakes in the comments<p>
	- Conversion of English Day of Week Description to Integer<p>
	- Conversion of English Month Description to Integer<p>
	- WeeksApart (Integer) and ExactWeeksApart (Float) added<p>
	- Added GetFirstSundayOfYear<p>
	- Added Week Number processing<p>

	v1.4.1 18-June-99<p>
	- Fixed Bug in ConvertRFC822Times<p>

	v1.4 21-May-99<p>
	- Now have over 125 Routines!<p>
	- Added AddDays (though this is simple Addition) for completion<p>
	- Added Heaps of new Date/Time Arithmetic Routines.
	Many suggested by John Atchison<p>
	- Added Heaps of Boolean Routines like IsJanuary, IsMonday, etc.
	Many suggested by John Atchison<p>
	- Added Seconds (Floating) to a string of days, hours, minutes, seconds.
	Routine donated by: Marcos Guzmán Montañez<p>

	v1.3 27-Apr-99<p>
	- Added TimeZone constants missing from D3 (but in D4 Windows.pas)<p>
	- Added StartofWeek which returns the Start of the week a date is in, i.e. the Sunday<p>
	- Added Routine to set Local Time Bias - see warnings below<p>
	- Added Routine to return Daylight Savings Info<p>
	- Added Routine to return set Daylight Savings Info - see warnings below<p>
	- Added Routines to return current Details - ThisYear, ThisMonth, ThisDay,
		ThisHr, ThisMin, ThisSec, ThisMSec<p>

	v1.2 19-Apr-1999<p>
	- Added RFC822 Time Zone Routines <p>
	- Fixed problem with Str2Ext <p>

	v 1.1 6-Apr-1999<p>
	- Added Better IsLeapYear<p>
	- Added GetFirstDayOfMonth & GetLastDayOfMonth<p>
	- Added Constants for Tropical Year and Synodic Month<p>
	- Added Calculation of GoldenNumber and Epact for given year<p>
	- Added GetGoodFriday and GetEasterSunday for given year<p>
	- Added GMTStr2Value<p>
	- Added GetLocalTZBias - which allows for Daylight Savings settings<p>
	- Added GetLocalTime - turns GMT into Local via Regional Settings<p>
	- All Local Time Zone routines handle Standard/Daylight Biases<p>
	- Added ConvertGMTStrTimes to convert between two GMT related Date/Times<p>

	v 1.0 6-Mar-1999 Intial Release <p>

	People who have helped out with ESBDates via good suggestions and/or
	code snippets:<P>

	Scott Kane<p>
	Peter Ogden<p>
	Dr John Stockton<p>
	John Atchison<p>
	Marcos Guzmán Montañez<p>
	Wolfgang Wendefeuer<p>
	Gary Mugford<p>
	David Gobbett<p>
	Niklas Astrom<p>
	Laurent PIERRE<p>
	Chris Means<p>
	Primoz Gabrijelcic<p>
	J. Peter Mugaas<p>
	Damien Racca<p>
	Wolfgang Werner<p>
	Mark Lussier<p>
	Ken Otto<p>
	Joel Joly
}
interface

{.$Define UseESBRoutines} // Uncomment if you have ESB Routines

{$IFDEF VER120}
{$DEFINE D4Plus}
{$ENDIF}
{$IFDEF VER125}
{$DEFINE D4Plus}
{$ENDIF}
{$IFDEF VER130}
{$DEFINE D4Plus}
{$ENDIF}
{$IFDEF VER140}
{$DEFINE D4Plus}
{$ENDIF}

uses
	Windows;

{$IFNDEF D4PLUS}
const
	TIME_ZONE_ID_STANDARD = 1;
	TIME_ZONE_ID_DAYLIGHT = 2;
{$ENDIF}

{$IFDEF VER90}
type
	LongInt = Integer;
{$ENDIF VER90}

// Date/Time Related Messages
ResourceString
	rsInvalidDate = 'Invalid Date';
	rsInvalidTime = 'Invalid Time';
	rsInvalidDateTime = 'Invalid Date/Time';

const
	//: Fraction of a TDateTime that represents One Hour.
	OneDTHour = 1 / 24;

	//: Fraction of a TDateTime that represents One Minute.
	OneDTMinute = 1 / (24 * 60);

	//: Fraction of a TDateTime that represents One Second.
	OneDTSecond = 1 / (24 * 60 * 60);

	//: Fraction of a TDateTime that represents One Millisecond.
	OneDTMillisecond = 1 / (24 * 60 * 60 * 1000);

const
	//: Seconds Per Minute
	SecsPerMin = 60;

	//: Minutes Per Second
	MinsPerSec = 1 / 60;

	//: Minutes Per Hour
	MinsPerHr = 60;

	//: Hours Per Minute
	HrsPerMin = 1 / 60;

	//: Seconds Per Hour
	SecsPerHr = 3600;

	//: Hours Per Per Second
	HrsPerSec = 1 / 3600;

	//: Hours Per Day
	HrsPerDay = 24;

	//: Days Per Hour
	DaysPerHr = 1 / 24;

	//: Minutes Per Day
	MinsPerDay = 24 * 60;

	//: Days Per Minute
	DaysPerMin = 1 / (24 * 60);

	//: Seconds Per Day
	SecsPerDay = 24 * 3600;

	//: Days Per Second
	DaysPerSec = 1 / (24 * 3600);

	//: Days Per Week
	DaysPerWeek = 7;

	//: Weeks Per Day
	WeeksPerDay = 1 / 7;

	//: Days Per Fortnight
	DaysPerFortnight = 14;

	//: Fortnights Per Day
	FortnightsPerDay = 1 / 14;

const
	{: Time it takes, in days, for the Earth to go from a point in
		its rotation and return to that point, i.e. a revolution.
		This amount changes (gets smaller) as time progresses.
		In 2100 it will be 365.242184 }
	DaysPerTropicalYear = 365.24219;

	// Days per Gregorian Year
	DaysPerGregorianYear = 365.2425;

	// Days per Julian Year
	DaysPerJulianYear = 365.25;

	{: Time it takes, in days, from one New Moon to the next.
		This amount change (gets larger) as time progresses.
		in 2100 it will be 29.5305891 }
	DaysPerSynodicMonth = 29.53059;

type
	{: Different ways in which 1 & 2 Digit Years are handled in Str2Date
		and in the Date Edit Components.

		@enum edyNone Nothing is done, left to Delphi to handle.
		@enum edyCutOff the <See Var=ESB2DigitCutOff> is used to decide
			which century the date lies in. If 1900 + Yr is less than
			ESB2DigitCutOff then it is assumed that 2000 + Yr is wanted,
			otherwise 1900 + Yr is used.
		@enum edyHistoric assumes that the yr is this year or earlier. }
	TESB2DigitYr = (edyNone, edyCutOff, edyHistoric);

var
	{: Different ways in which 1 & 2 Digit Years are handled in Str2Date
		and in the Date Edit Components.
		edyNone - Nothing is done, left to Delphi to handle. <p>
		edyCutOff - the <See Var=ESB2DigitCutOff> is used to decide
			which century the date lies in. If 1900 + Yr is less than
			ESB2DigitCutOff then it is assumed that 2000 + Yr is wanted,
			otherwise 1900 + Yr is used.<p>
		edyHistoric  - assumes that the yr is this year or earlier. }
	ESB2DigitYr: TESB2DigitYr = edyCutOff;
	{: If <See Var=ESB2DigitYr> = edyCutOff - then  ESB2DigitCutOff is used
		to decide	which century the date lies in. If 1900 + Yr less than
		ESB2DigitCutOff then it is assumed that 2000 + Yr is wanted,
		otherwise 1900 + Yr is used. }
	ESB2DigitCutOff: Word = 1920;

//: English Days of Week - used for DOW2Int
const
	DayOfWeekStrings: array [1..7] of String = ('SUNDAY', 'MONDAY', 'TUESDAY',
		'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY');

//: English Calendar Months - used for Month2Int
const
	MonthStrings: array [1..12] of String = ('JANUARY', 'FEBRUARY', 'MARCH',
		'APRIL','MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER',
		'NOVEMBER', 'DECEMBER');

{--- Current Date ---}
{: A Speed Optimised Routine to get the Current Date. Time Portion is Zero.
	@cat DTMath
}
function OptDate: TDateTime;

{--- Conversions ---}

{: A Speed Optimised DecodeDate developed by Ken Otto that is many times faster
	than the once included in SysUtils. If you need Words rather than Integers
	use the slightly slower OptDecodeDateW.
	@cat DTConv
}
procedure OptDecodeDateI (const DT: TDateTime; out Year, Month, Day: Integer);

{: A Speed Optimised DecodeDate developed by Ken Otto that is many times faster
	than the once included in SysUtils. If you want even faster results and
	are happy to use Integers than use the slightly slower OptDecodeDateI.
	@cat DTConv
}
procedure OptDecodeDateW (const DT: TDateTime; out Year, Month, Day: Word);

{: A Speed Optimised EncodeDate developed by Ken Otto that is many times faster
	than the once included in SysUtils, and includes Exception Handling. If you
	need Words rather than Integers use the slightly slower OptEncodeDateW.
	@cat DTConv
}
function OptEncodeDateI (Year, Month, Day: Integer): TDateTime;

{: A Speed Optimised EncodeDate developed by Ken Otto that is many times faster
	than the once included in SysUtils, and includes Exception Handling. If you
	want even faster results and are happy to use Integers than use the
	slightly slower OptEncodeDateI.
	@cat DTConv
}
function OptEncodeDateW (Year, Month, Day: Word): TDateTime;

{: A Speed Optimised Routine for getting the Year portion of a Date based on
	Routine by Ken Otto that is many times faster than using DecodeDate in
	SysUtils.
	@cat DTConv
}
function OptDate2Year (const DT: TDateTime) : Word;

{: A Speed Optimised Routine for getting the Month portion of a Date based on
	Routine by Ken Otto that is many times faster than using DecodeDate in
	SysUtils.
	@cat DTConv
}
function OptDate2Month (const DT: TDateTime) : Word;

{: A Speed Optimised Routine for getting the Day portion of a Date based on
	Routine by Ken Otto that is many times faster than using DecodeDate in
	SysUtils.
	@cat DTConv
}
function OptDate2Day (const DT: TDateTime) : Word;

{: Returns the current Year - from Today's Date.
	This Integer routine is faster than <See Routine=ThisYear>.
	@cat DTConv
	@cat YearMath
}
function OptThisYear: Integer;

{: Returns the current Month - from Today's Date.
	This Integer routine is faster than <See Routine=ThisMonth>.
	@cat DTConv
	@cat MonthMath
}
function OptThisMonth: Integer;

{: Returns the current Day - from Today's Date.
	This Integer routine is faster than <See Routine=ThisDay>.
	@cat DTConv
}
function OptThisDay: Integer;

{: Returns the Day Number in the Year represented by the given Date.
	@param DT Date/Time to process.
	@cat DTMath
	@cat YearMath
}
function OptDayOfYear (const DT: TDateTime): Integer;

{: Returns the Day Number in this Year represented by today.
	@cat DTMath
	@cat YearMath
}
function OptThisDayOfYear: Integer;

{: Returns the number of days left in the Year represented by the given Date.
	@param DT Date/Time to process.
	@cat DTMath
	@cat YearMath
}
function OptDaysLeftInYear (const DT: TDateTime): Integer;

{: Returns the number of days left in this Year.
	@cat DTMath
	@cat YearMath
}
function OptDaysLeftInThisYear: Integer;

//--- Year Based Routines ---

{: Is given Year a Leap Year. Thanks to Dr John Stockton
	for suggesting a faster methodology.
	@param Year the Year to be processed - should be 4 digit, eg 1999.
	@cat YearMath
	@cat DTComparison
}
function IsLeapYear (Year: Word): Boolean;

{: Returns the GoldenNumber for a given Year. Values are 1 -> 19.
	The relationship between the Moon's Phases and the Year, repeats
	itself every 19 years.
	@param Year the Year to be processed - should be 4 digit, eg 1999.
	@cat YearMath
}
function GetGoldenNumber (const Year: Word): Integer;

{: Return the Epact, which is a measure of the age of the moon (ie the number
	of days that have passed since an "official" new moon) on a particular date.
	@param Year the Year to be processed - should be 4 digit, eg 1999.
	@cat YearMath
}
function GetEpact (const Year: Word): Integer;

{:Returns the Date of Easter Sunday for given Year - based on current Calendar.
	@param Year the Year to be processed - should be 4 digit, eg 1999.
	@cat YearMath
}
function GetEasterSunday (const Year: Word): TDateTime;

{:Returns the Date of Good Friday for given Year - based on current Calendar.
	@param Year the Year to be processed - should be 4 digit, eg 1999.
	@cat YearMath
}
function GetGoodFriday (const Year: Word): TDateTime;

{: Returns First Day of the Year, for a given Year.
	@param Year the Year to be processed - should be 4 digit, eg 1999.
	@cat YearMath
}
function GetFirstDayOfYear (const Year: Word): TDateTime;

{: Returns Last Day of the Year, for a given Year.
	@param Year the Year to be processed - should be 4 digit, eg 1999.
	@cat YearMath
}
function GetLastDayOfYear (const Year: Word): TDateTime;

{: Returns First Sunday of the Year, for a given Year. Used in
	Week No Routines.
	@param Year the Year to be processed - should be 4 digit, eg 1999.
	@cat YearMath
	@cat WeekMath
}
function GetFirstSundayOfYear (const Year: Word): TDateTime;

//--- Conversions ---

{: Returns Date as a String using ShortDateFormat from Regional
	Settings. If the Date is Zero, then an Empty String will be returned.<p>
	If an error occurs an Empty String is Returned.
	@param DT Date/Time to Convert.
	@cat DTConv
}
function Date2Str (const DT: TDateTime): String;

{: Returns the Day of the Month number from a given date/time.
	@param DT Date/Time to Convert.
	@returns the Day of the Month.
	@cat DTConv
}
function Date2Day (const DT: TDateTime): Word;

{: Returns the Month number from a given date/time, 1 = Jan, etc.
	@param DT Date/Time to Convert.
	@returns the Month where 1 = Jan, through 12 = Dec.
	@cat DTConv
	@cat MonthMath
}
function Date2Month (const DT: TDateTime): Word;

{: Returns the Year from a given date/time.
	@param DT Date/Time to Convert.
	@returns the Year component, including Century.
	@cat DTConv
	@cat YearMath
}
function Date2Year (const DT: TDateTime): Word;

{: Returns the Time Portion as a string HH:MM with time separator
	from the Regional Settings. If DT is 0, then an Empty String will be
	returned.<p>
	@param DT Date/Time to Convert.
	@cat DTConv
}
function Time2Str (const DT: TDateTime): String;

{: Returns the Hour from a given date/time.
	@param DT Date/Time to Convert.
	@returns the Hour component.
	@cat DTConv
}
function Time2Hr (const DT: TDateTime): Word;

{: Returns the Minute from a given date/time.
	@param DT Date/Time to Convert.
	@returns the Minute component.
	@cat DTConv
}
function Time2Min (const DT: TDateTime): Word;

{: Returns the Second from a given date/time.
	@param DT Date/Time to Convert.
	@returns the Second component.
	@cat DTConv
}
function Time2Sec (const DT: TDateTime): Word;

{: Returns the Millisecond from a given date/time.
	@param DT Date/Time to Convert.
	@returns the Millisecond component.
	@cat DTConv
}
function Time2MSec (const DT: TDateTime): Word;

{: Returns the current Year - from Today's Date.
	@cat DTConv
	@cat YearMath
}
function ThisYear: Word;

{: Returns the current Month - from Today's Date.
	@cat DTConv
	@cat MonthMath
}
function ThisMonth: Word;

{: Returns the current Day - from Today's Date.
	@cat DTConv
}
function ThisDay: Word;

{: Returns the current Hour - from the current Time.
	@cat DTConv
}
function ThisHr: Word;

{: Returns the current Minute - from the current Time.
	@cat DTConv
}
function ThisMin: Word;

{: Returns the current Second - from the current Time.
	@cat DTConv
}
function ThisSec: Word;

{: Returns the current Millisecond - from the current Time.
	@cat DTConv
}
function ThisMSec: Word;

{: Converts a string containing a Time into a DateTime.
	@param S The String to convert.
	@cat DTConv
}
function Str2Time (S: String): TDateTime;

{: Converts a string containing a Date into a DateTime. If the Item
	has no month and/or year then the current month and year will be assumed. <p>
	<See Var=ESB2DigitYr> contols the different ways in which 2 Digit Years
	are handled in	Str2Date.<p>

	edyNone - Nothing is done, left to Delphi to handle. <p>
	edyCutOff - the  ESB2DigitCutOff is used to decide which century
		the date lies in. If 1900 + Yr less than <See Var=ESB2DigitCutOff>
		then it is assumed that 2000 + Yr is wanted, otherwise 1900 + Yr
		is used.<p>
	edyHistoric  - asssumes that the yr is this year or earlier.
	@param InDate The String to convert.
	@cat DTConv
}
function Str2Date (S: String): TDateTime;

{: An enhanced routine to converts a string containing a Date into a DateTime,
	donated by Tom Grieve. If the Item has no month and/or year then the current
	month and year will be assumed. <p>
	<See Var=ESB2DigitYr> contols the different ways in which 2 Digit Years
	are handled in	Str2Date.<p> This routine also handles Dates of the form
	'03 Jun 2001' where the month is in alphabetic form.<p>

	edyNone - Nothing is done, left to Delphi to handle. <p>
	edyCutOff - the  ESB2DigitCutOff is used to decide which century
		the date lies in. If 1900 + Yr less than <See Var=ESB2DigitCutOff>
		then it is assumed that 2000 + Yr is wanted, otherwise 1900 + Yr
		is used.<p>
	edyHistoric  - asssumes that the yr is this year or earlier.
	@param S The String to convert.
	@cat DTConv
}
function EnhStr2Date (InDate: String): TDateTime;

{: Converts a string containing a Date into a DateTime. If the Item
	has no month and/or year then the current month and year will be assumed. <p>
	If a 2 Digit Year is used then it is assumted that it is this year or earlier.
	@param S The String to convert.
	@cat DTConv
}
function Str2HistoricDate (S: String): TDateTime;

{: Converts a string containing a Date into a DateTime. If the Item
	has no month and/or year then the current month and year will be assumed. <p>
	If a 2 Digit Year is used then CutOff is used to decide which century
	the date lies in. If 1900 + Yr less than CutOff then it is assumed that
	2000 + Yr is wanted, otherwise 1900 + Yr is used.
	@param S The String to convert.
	@cat DTConv
}
function Str2CutOffDate (S: string; const CutOff: Word): TDateTime;

{: Returns the Long Month Description for the supplied Date. Relies
	on Regional Settings.
	@param DT Date/Time to convert.
	@returns the Long Month Name of the Month component.
	@cat DTConv
	@cat MonthMath
}
function Date2LongMonth (const DT: TDateTime): string;

{: Returns the Short Month Description for the supplied Date. Relies
	on Regional Settings.
	@param DT Date/Time to convert.
	@returns the Short Month Name of the Month component.
	@cat DTConv
	@cat MonthMath
}
function Date2ShortMonth (const DT: TDateTime): string;

{: Returns the Long Day of Week Description for the supplied Date. Relies
	on Regional Settings.
	@param DT Date/Time to convert.
	@returns the Long Day of Week Name for the given Date.
	@cat DTConv
}
function Date2LongDOW (const DT: TDateTime): string;

{: Given a Month Name this routines searches through the Short and then
	Long Month Names supplied in the Registry to do a Left Match, and
	then return the Month Number. So for English Names, 'Ma' would return
	3 for 'March' .
	@param MonthName Name of the Month to search for.
	@returns the Month Number, 1 through 12 - 0 implies not found.
	@cat DTConv
	@cat MonthMath
}
function MonthName2Month (const MonthName: string): Word;

{: Given a Day Name this routines searches through the Short and then
	Long Day Names supplied in the Registry to do a Left Match, and
	then return the Day Number. So for English Names, 'T' would return
	3 for 'Tuesday'.
	@param DayName Name of the Day of Week to search for.
	@returns the DOW Number, 1 through 7 - 0 implies not found. 1 is Sunday.
	@cat DTConv
}
function DayName2DOW (const DayName: string): Byte;

{: Converts a String in ISO Format, eg '2000-07-19 12:10:22' to a TDateTime.
	Leading and trailing spaces are ignored - seconds can be omitted - in
	fact the whole time can be omitted. Routine suggest by Wolfgang Werner.
	@param ISODT String representing ISO Formatted Date Time - 'yyyy-mm-dd hh:mm:ss'.
	@return String converted to TDateTime - 0 if any errors
	@cat DTConv
}

function ISODateTime2DateTime (const ISODT: String): TDateTime;

{: Returns the number of Hours the specified number of Days represents.
	@param Value Number of Days
	@returns the Number of Hours
	@cat DTConv
}
function Days2Hrs (const Value: Extended): Extended;

{: Returns the number of Days the specified number of Hours represents.
	@param Value Number of Hours
	@returns the Number of Days
	@cat DTConv
}
function Hrs2Days (const Value: Extended): Extended;

{: Returns the number of Hours the specified number of Mintues represents.
	@param Value Number of Minutes
	@returns the Number of Hours
	@cat DTConv
}
function Mins2Hrs (const Value: Extended): Extended;

{: Returns the number of Minutes the specified number of Hours represents.
	@param Value Number of Hours
	@returns the Number of Minutes
	@cat DTConv
}
function Hrs2Mins (const Value: Extended): Extended;

{: Returns the number of Minutes the specified number of Seconds represents.
	@param Value Number of Minutes
	@returns the Number of Seconds
	@cat DTConv
}
function Mins2Secs (const Value: Extended): Extended;

{: Returns the number of Seconds the specified number of Mintues represents.
	@param Value Number of Seconds
	@returns the Number of Minutes
	@cat DTConv
}
function Secs2Mins (const Value: Extended): Extended;

{: Returns the number of Seconds the specified number of Days represents.
	@param Value Number of Days
	@returns the Number of Seconds
	@cat DTConv
}
function Days2Secs (const Value: Extended): Extended;

{: Returns the number of Days the specified number of Seconds represents.
	@param Value Number of Seconds
	@returns the Number of Days
	@cat DTConv
}
function Secs2Days (const Value: Extended): Extended;

{: Returns the number of Hours the specified number of Seconds represents.
	@param Value Number of Seconds
	@returns the Number of Hours
	@cat DTConv
}
function Secs2Hrs (const Value: Extended): Extended;

{: Returns the number of Seconds the specified number of Hours represents.
	@param Value Number of Hours
	@returns the Number of Seconds
	@cat DTConv
}
function Hrs2Secs (const Value: Extended): Extended;

{: Returns the number of Minutes the specified number of Days represents.
	@param Value Number of Days
	@returns the Number of Minutes
	@cat DTConv
}
function Days2Mins (const Value: Extended): Extended;

{: Returns the number of Days the specified number of Minutes represents.
	@param Value Number of Minutes
	@returns the Number of Days
	@cat DTConv
}
function Mins2Days (const Value: Extended): Extended;

{: Returns the number of Weeks the specified number of Days represents.
	@param Value Number of Days
	@returns the Number of Weeks
	@cat DTConv
}
function Days2Weeks (const Value: Extended): Extended;

{: Returns the number of Days the specified number of Weeks represents.
	@param Value Number of Weeks
	@returns the Number of Days
	@cat DTConv
}
function Weeks2Days (const Value: Extended): Extended;

{: Returns the number of Fortnights the specified number of Days represents.
	@param Value Number of Days
	@returns the Number of Fortnights
	@cat DTConv
}
function Days2Fortnights (const Value: Extended): Extended;

{: Returns the number of Days the specified number of Fortnights represents.
	@param Value Number of Fortnights
	@returns the Number of Days
	@cat DTConv
}
function Fortnights2Days (const Value: Extended): Extended;

{: Returns the number of Months the specified number of Days represents. Months
	are based on Synodic Months - see <See Const=DaysPerSynodicMonth>.
	@param Value Number of Days
	@returns the Number of Months
	@cat DTConv
}
function Days2Months (const Value: Extended): Extended;

{: Returns the number of Days the specified number of Months represents.  Months
	are based on Synodic Months - see <See Const=DaysPerSynodicMonth>.
	@param Value Number of Months (Synodic)
	@returns the Number of Days
	@cat DTConv
}
function Months2Days (const Value: Extended): Extended;

{: Returns the number of Years the specified number of Days represents. Years
	are based on Tropical Years - see <See Const=DaysPerTropicalYear>.
	@param Value Number of Days
	@returns the Number of Years (Tropical)
	@cat DTConv
}
function Days2Years (const Value: Extended): Extended;

{: Returns the number of Days the specified number of Years represents.  Months
	are based on Tropical years - see <See Const=DaysPerTropicalYear>.
	@param Value Number of Years (Tropical)
	@returns the Number of Days
	@cat DTConv
}
function Years2Days (const Value: Extended): Extended;

{: Returns the number of Years the specified number of Days represents. Years
	are based on Gregorian Years - see <See Const=DaysPerGregorianYear>.
	@param Value Number of Days
	@returns the Number of Years (Gregorian)
	@cat DTConv
}
function Days2YearsGregorian (const Value: Extended): Extended;

{: Returns the number of Days the specified number of Years represents.  Months
	are based on Gregorian years - see <See Const=DaysPerGregorianYear>.
	@param Value Number of Years (Gregorian)
	@returns the Number of Days
	@cat DTConv
}
function YearsGregorian2Days (const Value: Extended): Extended;

{: Returns the number of Years the specified number of Days represents. Years
	are based on Julian Years - see <See Const=DaysPerJulianYear>.
	@param Value Number of Days
	@returns the Number of Years (Julian)
	@cat DTConv
}
function Days2YearsJulian (const Value: Extended): Extended;

{: Returns the number of Days the specified number of Years represents.  Months
	are based on Julian years - see <See Const=DaysPerJulianYear>.
	@param Value Number of Years (Julian)
	@returns the Number of Days
	@cat DTConv
}
function YearsJulian2Days (const Value: Extended): Extended;

{: Converts a quantity of seconds into a String of the form 'h:mm:ss'.
	Routine proposed by Joel Joly.
	@cat DTConv
}
function Sec2TimeStr (Sec : LongInt): string;

//--- Date/Time Arithmetic ---

{: Returns the number of whole minutes apart the two times are (date portion ignored)
	and DT1 is assumed to be before DT2.
	@param DT1 First Time, Date portion ignores - assumed to be the earlier time.
	@param DT2 Second Time, Date portion ignores - assumed to be the later time.
	@cat DTMath
}
function MinutesApart (const DT1, DT2: TDateTime): Word;

{: Returns the decimal number of Days apart the two date/times are. If 0 then
	they are the same Date/Time, if negative then DT1 occurs after DT2 DT2.
	@param DT1 First Date/Time to process.
	@param DT2 Second DateTime to process.
	@cat DTMath
}
function TimeApartInDays (const DT1, DT2: TDateTime): Extended;

{: Returns the decimal number of Weeks apart the two date/times are. If 0 then
	they are the same Date/Time, if negative then DT1 occurs after DT2 DT2.
	@param DT1 First Date/Time to process.
	@param DT2 Second DateTime to process.
	@cat DTMath
}
function TimeApartInWeeks (const DT1, DT2: TDateTime): Extended;

{: Returns the decimal number of fortnights apart the two date/times are. If 0 then
	they are the same Date/Time, if negative then DT1 occurs after DT2 DT2.
	@param DT1 First Date/Time to process.
	@param DT2 Second DateTime to process.
	@cat DTMath
}
function TimeApartInFortnights (const DT1, DT2: TDateTime): Extended;

{: Returns the decimal number of hours apart the two date/times are. If 0 then
	they are the same Date/Time, if negative then DT1 occurs after DT2 DT2.
	@param DT1 First Date/Time to process.
	@param DT2 Second DateTime to process.
	@cat DTMath
}
function TimeApartInHrs (const DT1, DT2: TDateTime): Extended;

{: Returns the decimal number of Minutes apart the two date/times are. If 0 then
	they are the same Date/Time, if negative then DT1 occurs after DT2 DT2.
	@param DT1 First Date/Time to process.
	@param DT2 Second DateTime to process.
	@cat DTMath
}
function TimeApartInMins (const DT1, DT2: TDateTime): Extended;

{: Returns the decimal number of Seconds apart the two date/times are. If 0 then
	they are the same Date/Time, if negative then DT1 occurs after DT2 DT2.
	@param DT1 First Date/Time to process.
	@param DT2 Second DateTime to process.
	@cat DTMath
}
function TimeApartInSecs (const DT1, DT2: TDateTime): Extended;

{: Converts a time in MilliSeconds to a string of the form 'H:MM:SS.mmm'.
	@param MS Value in Milliseconds.
	@cat DTMath
}
function MS2TimeStr (const MS: LongInt): String;

{: Returns the current date/time as a string in the Format of: YYYYMMDD-HHMMSSmmm.
	@cat DTMath
}
function GetDateTimeStamp: String;

{: Adjusts the date so that it has the Year specified. Makes 29 Feb of any
	year that is not a Leap year 1 Mar.
	@param D Date/Time to process.
	@param Year Year to make the date in, eg 1999.
	@cat DTMath
	@cat YearMath
}
function AdjustDateYear (const D: TDateTime; const Year: Word): TDateTime;

{: Adds a Floating Point amount of Seconds to a Given Date/Time.
	@param DT Date/Time to process.
	@param Secs Number of Seconds to Add - can be negative.
	@cat DTMath
}
function AddSecs (const DT: TDateTime; const Secs: Extended): TDateTime;

{: Adds a Floating Point amount of Minutes to a Given Date/Time.
	@param DT Date/Time to process.
	@param Mins Number of Minutes to Add - can be negative.
	@cat DTMath
}
function AddMins (const DT: TDateTime; const Mins: Extended): TDateTime;

{: Adds a Floating Point amount of Hours to a Given Date/Time.
	@param DT Date/Time to process.
	@param Hrss Number of Hours to Add - can be negative.
	@cat DTMath
}
function AddHrs (const DT: TDateTime; const Hrs: Extended): TDateTime;

{: Adds a Floating Point amount of Days to a Given Date/Time.
	Though this is the same as normal Addition it is added for completion.
	@param DT Date/Time to process.
	@param Dayss Number of Days to Add - can be negative.
	@cat DTMath
}
function AddDays (const DT: TDateTime; const Days: Extended): TDateTime;

{: Adds a Floating Point amount of Weeks to a Given Date/Time.
	@param DT Date/Time to process.
	@param Weeks Number of Weeks to Add - can be negative.
	@cat DTMath
	@cat WeekMath
}
function AddWeeks (const DT: TDateTime; const Weeks: Extended): TDateTime;

{: Adds a Floating Point amount of Fortnights to a Given Date/Time.
	@param DT Date/Time to process.
	@param Fortnights Number of Fortnights to Add - can be negative.
	@cat DTMath
}
function AddFortnights (const DT: TDateTime; const FNights: Extended): TDateTime;

{: Adds a Floating Point amount of Months to a Given Date/Time.
	Fractional portion of Month is assumed to be related to 30 day months.
	Time portion preserved.<p>

	If adding Months results in landing on a nonsense date like 31 Apr
	then the last day in the month is used. This only applies to the
	integral component of the Months Added. The fractional part always
	is added to the resultant Date/Time.

	@param DT Date/Time to process.
	@param Months Number of Months to Add - can be negative.
	@cat DTMath
	@cat MonthMath
}
function AddMonths (const DT: TDateTime; const Months: Extended): TDateTime;

{: Adds a Floating Point amount of Quarters to a Given Date/Time.
	Fractional portion of Quarter is assumed to be related to 30 day month,
	as the AddMonths routine is used.
	Time portion preserved. <p>

	If adding Quarters results in landing on a nonsense date like 31 Apr
	then the last day in the month is used. This only applies to the
	integral component of the Quarter Added. The fractional part always
	is added to the resultant Date/Time.

	@param DT Date/Time to process.
	@param Qtrs Number of Quarters to Add - can be negative.
	@cat DTMath
}
function AddQuarters (const DT: TDateTime; const Qtrs: Extended): TDateTime;

{: Adds a Floating Point amount of Semesters to a Given Date/Time.
	Fractional portion of Semester is assumed to be related to 30 day month,
	as the AddMonths routine is used.
	Time portion preserved.<p>

	If adding Semesters results in landing on a nonsense date like 31 Apr
	then the last day in the month is used. This only applies to the
	integral component of the Semeters Added. The fractional part always
	is added to the resultant Date/Time.

	@param DT Date/Time to process.
	@param Sems Number of Semesters to Add - can be negative.
	@cat DTMath
}
function AddSemesters (const DT: TDateTime; const Sems: Extended): TDateTime;

{: Adds a Floating Point amount of Years to a Given Date/Time.
	Fractional portion of Year is assumed to be related to 365.25 day years.
	Time portion preserved.<p>

	If Adding Years results in landing on Feb 29 in a non-leap year, then
	this will be converted to Feb 28.This only applies to the
	integral component of the Years Added. The fractional part always
	is added to the resultant Date/Time.

	@param DT Date/Time to process.
	@param Yrs Number of Years to Add - can be negative.
	@cat DTMath
	@cat YearMath
}
function AddYrs (const DT: TDateTime; const Yrs: Extended): TDateTime;

{: Subtracts a Floating Point amount of Seconds from a Given Date/Time.
	@param DT Date/Time to process.
	@param Secs Number of Seconds to Subtract - can be negative.
	@cat DTMath
}
function SubtractSecs (const DT: TDateTime; const Secs: Extended): TDateTime;

{: Subtracts a Floating Point amount of Minutes from a Given Date/Time.
	@param DT Date/Time to process.
	@param Mins Number of Minutes to Subtract - can be negative.
	@cat DTMath
}
function SubtractMins (const DT: TDateTime; const Mins: Extended): TDateTime;

{: Subtracts a Floating Point amount of Hours from a Given Date/Time.
	@param DT Date/Time to process.
	@param Hrs Number of Hours to Subtract - can be negative.
	@cat DTMath
}
function SubtractHrs (const DT: TDateTime; const Hrs: Extended): TDateTime;

{: Subtracts a Floating Point amount of Days from a Given Date/Time.
	@param DT Date/Time to process.
	@param Days Number of Days to Subtract - can be negative.
	@cat DTMath
}
function SubtractDays (const DT: TDateTime; const Days: Extended): TDateTime;

{: Subtracts a Floating Point amount of Weeks from a Given Date/Time.
	@param DT Date/Time to process.
	@param Weeks Number of Weeks to Subtract - can be negative.
	@cat DTMath
	@cat WeekMath
}
function SubtractWeeks (const DT: TDateTime; const Weeks: Extended): TDateTime;

{: Subtracts a Floating Point amount of Fortnights from a Given Date/Time.
	@param DT Date/Time to process.
	@param Fortnights Number of Fortnights to Subtract - can be negative.
	@cat DTMath
}
function SubtractFortnights (const DT: TDateTime; const FNights: Extended): TDateTime;

{: Subtracts a Floating Point amount of Months from a Given Date/Time.
	Fractional portion of Month is assumed to be related to 30 day months.
	Time portion preserved. <p>

	If Subtracting Months results in landing on a nonsense date like 31 Apr
	then the last day in the month is used. This only applies to the
	integral component of the Months Subtracted. The fractional part always
	is Subtracted from the resultant Date/Time.

	@param DT Date/Time to process.
	@param Months Number of Months to Subtract - can be negative.
	@cat DTMath
	@cat MonthMath
}
function SubtractMonths (const DT: TDateTime; const Months: Extended): TDateTime;

{: Subtracts a Floating Point amount of Quarters from a Given Date/Time.
	Fractional portion of Quarter is assumed to be related to 30 day month,
	as the AddMonths routine is used. Time portion preserved.<p>

	If Subtracting Quarters results in landing on a nonsense date like 31 Apr
	then the last day in the month is used. This only applies to the
	integral component of the Quarter Subtracted. The fractional part always
	is Subtracted from the resultant Date/Time.

	@param DT Date/Time to process.
	@param Qtrs Number of Quarters to Subtract - can be negative.
	@cat DTMath
}
function SubtractQuarters (const DT: TDateTime; const Qtrs: Extended): TDateTime;

{: Subtracts a Floating Point amount of Semesters from a Given Date/Time.
	Fractional portion of Semester is assumed to be related to 30 day month,
	as the AddMonths routine is used. Time portion preserved.<p>

	If Subtracting Semesters results in landing on a nonsense date like 31 Apr
	then the last day in the month is used. This only applies to the
	integral component of the Semeters Subtracted. The fractional part always
	is Subtracted from the resultant Date/Time.

	@param DT Date/Time to process.
	@param Sems Number of Semesters to Subtract - can be negative.
	@cat DTMath
}
function SubtractSemesters (const DT: TDateTime; const Sems: Extended): TDateTime;

{: Subtracts a Floating Point amount of Years from a Given Date/Time.
	Fractional portion of Year is assumed to be related to 365.25 day years.
	Time portion preserved.<p>

	If Subtracting Years results in landing on Feb 29 in a non-leap year, then
	this will be converted to Feb 28.This only applies to the
	integral component of the Years Subtracted. The fractional part always
	is Subtracted from the resultant Date/Time.

	@param DT Date/Time to process.
	@param Yrs Number of Years to Subtract - can be negative.
	@cat DTMath
	@cat YearMath
}
function SubtractYrs (const DT: TDateTime; const Yrs: Extended): TDateTime;

{: Returns Last Day of the Month, for a given Date/Time - Time portion preserved.
	Alternatively for a given Month Year.
	@param DT Date/Time to process.
	@cat DTMath
	@cat MonthMath
}
function GetLastDayOfMonth (const DT: TDateTime): TDateTime;

{: Returns First Day of the Month, for a given Date/Time - Time portion preserved.
	Alternatively for a given Month Year.
	@param DT Date/Time to process.
	@cat DTMath
	@cat MonthMath
}
function GetFirstDayOfMonth (const DT: TDateTime): TDateTime;

{: Returns the Start of the week containing given Date/Time, assumes that
	the Start of the Week is Sunday - Time portion preserved.
	@param DT Date/Time to process.
	@cat DTMath
	@cat WeekMath
}
function StartOfWeek (const DT: TDateTime): TDateTime;

{: Returns the End of the week containing given Date/Time, assumes that
	the End of the Week is Saturday - Time portion preserved.
	@param DT Date/Time to process.
	@cat DTMath
	@cat WeekMath
}
function EndOfWeek (const DT: TDateTime): TDateTime;

{: Converts a given number of Seconds (Floating) into a string
	specifying the number of days, hours, minutes, seconds.
	Routine donated by: Marcos Guzmán Montañez.
	@param Secs Number of Seconds as a float
	@cat DTMath
	@cat DTConv
}
function Hrs_Min_Sec (Secs: Extended): string;

{: Returns true if both DateTimes refer to the same Calendar Month,
	can have different years.
	@param DT1 First Date/Time to process.
	@param DT2 Second Date/Time to process.
	@cat DTMath
	@cat MonthMath
	@cat DTComparison
}
function DatesInSameMonth (const DT1, DT2: TDateTime): Boolean;

{: Returns true if both DateTimes refer to the same Year.
	@param DT1 First Date/Time to process.
	@param DT2 Second Date/Time to process.
	@cat DTMath
	@cat YearMath
	@cat DTComparison
}
function DatesInSameYear (const DT1, DT2: TDateTime): Boolean;

{: Returns true if both DateTimes refer to the exact same Month,
	cannot have different years.
	@param DT1 First Date/Time to process.
	@param DT2 Second Date/Time to process.
	@cat DTMath
	@cat MonthMath
	@cat DTComparison
}
function DatesInSameMonthYear (const DT1, DT2: TDateTime): Boolean;

{: Returns the Number of Days between DT2 and DT1. If result is 0 then
	they are the same Date, if result is negative then DT2 occurs before
	DT1. Today and yesterday are 1 day apart.
	@param DT1 First Date/Time to process.
	@param DT2 Second Date/Time to process.
	@cat DTMath
}
function DaysApart (const DT1, DT2: TDateTime): LongInt;

{: Returns the Exact Number of Weeks between DT2 and DT1. If result is 0 then
	they are in the same Day, if result is negative then DT2 occurs before
	DT1.
	@param DT1 First Date/Time to process.
	@param DT2 Second Date/Time to process.
	@cat DTMath
	@cat WeekMath
}
function ExactWeeksApart (const DT1, DT2: TDateTime): Extended;

{: Returns the Number of Weeks between DT2 and DT1. If result is 0 then
	they are in within a Week of each other, if result is negative then DT2
	occurs before DT1.
	@param DT1 First Date/Time to process.
	@param DT2 Second Date/Time to process.
	@cat DTMath
	@cat WeekMath
}
function WeeksApart (const DT1, DT2: TDateTime): LongInt;

{: Returns the Number of Calendar Weeks between DT2 and DT1. A Calendar Week is
	taken as starting with Sunday. If result is 0 then they are in within the
	same Calendar Week, if result is negative then DT2 occurs in a Calendar
	Week before DT1.
	@param DT1 First Date/Time to process.
	@param DT2 Second Date/Time to process.
	@cat DTMath
	@cat WeekMath
}
function CalendarWeeksApart (const DT1, DT2: TDateTime): LongInt;

{: Returns the Number of Calendar Months between DT2 and DT1. If result is 0
	then they are in within the same Calendar Month, if result is negative
	then DT2	occurs in a Calendar Month before DT1.
	@param DT1 First Date/Time to process.
	@param DT2 Second Date/Time to process.
	@cat DTMath
	@cat WeekMath
}
function CalendarMonthsApart (const DT1, DT2: TDateTime): LongInt;

{: Is given Date/Time in a Leap Year. Thanks to Dr John Stockton
	for suggesting a faster methodology.
	@param DT Date/Time to process.
	@cat DTMath
	@cat DTComparison
}
function DateIsLeapYear (const DT: TDateTime): Boolean;

{: Returns the number of days in the Month represented by the given Date.
	@param DT Date/Time to process.
	@cat DTMath
	@cat MonthMath
}
function DaysInMonth (const DT: TDateTime): Byte;

{: Returns the number of days in the current Month.
	@cat DTMath
	@cat MonthMath
}
function DaysInThisMonth: Byte;

{: Returns the Number of days left in the Month represented by the given Date.
	@param DT Date/Time to process.
	@cat DTMath
	@cat MonthMath
}
function DaysLeftInMonth (const DT: TDateTime): Byte;

{: Returns the number of days left in the current Month.
	@param DT Date/Time to process.
	@cat DTMath
	@cat MonthMath
}
function DaysLeftInThisMonth: Byte;

{: Returns the number of days in the Year represented by the given Date.
	@param DT Date/Time to process.
	@cat DTMath
	@cat YearMath
}
function DaysInYear (const DT: TDateTime): Word;

{: Returns the Day Number in the Year represented by the given Date.
	@param DT Date/Time to process.
	@cat DTMath
	@cat YearMath
}
function DayOfYear (const DT: TDateTime): Word;

{: Returns the Day Number in this Year represented by today.
	@cat DTMath
	@cat YearMath
}
function ThisDayOfYear: Word;

{: Returns the number of days left in the Year represented by the given Date.
	@param DT Date/Time to process.
	@cat DTMath
	@cat YearMath
}
function DaysLeftInYear (const DT: TDateTime): Word;

{: Returns the number of days left in this Year.
	@cat DTMath
	@cat YearMath
}
function DaysLeftInThisYear: Word;

{: Returns 1 if Date in Jan through Jun or 2 if Date in Jul through Dec.
	@param DT Date/Time to process.
	@cat DTMath
}
function WhichSemester (const DT: TDateTime): Byte;

{: Returns 1 if Date in Jan through Mar, 2 if Date in Apr through Jun,
	3 if Date in Jul through Sep, 4 if Date in Oct through Dec.
	@param DT Date/Time to process.
	@cat DTMath
}
function WhichQuarter (const DT: TDateTime): Byte;

{: Returns First Day of the Quarter, for a given Date/Time - Time portion,
	preserved.
	@param DT Date/Time to process.
	@cat DTMath
}
function GetFirstDayOfQuarter (const DT: TDateTime): TDateTime;

{: Returns Last Day of the Quarter, for a given Date/Time - Time portion
	preserved.
	@param DT Date/Time to process.
	@cat DTMath
}
function GetLastDayOfQuarter (const DT: TDateTime): TDateTime;

{: Returns First Day of the Quarter, for a given Quarter and Year.
	@param Qtr Quarter No, 1 through 4.
	@param Year 4-digit Year such as 1999.
	@cat DTMath
}
function GetFirstDayofQuarter2 (const Qtr: Byte; const Year: Word): TDateTime;

{: Returns Last Day of the Quarter, for a given Quarter and Year.
	@param Qtr Quarter No, 1 through 4.
	@param Year 4-digit Year such as 1999.
	@cat DTMath
}
function GetLastDayofQuarter2 (const Qtr: Byte; const Year: Word): TDateTime;

{: Returns the Age (in years) of a "person" given their Date of Birth (DOB)
	and the Date of Reference (DT). If DT occurs before DB then -1 is
	returned.
	@param DOB Date of Birth.
	@param DT Date in question.
	@returns Age in Integral Years at the Date in question.
	@cat DTMath
	@cat YearMath
}
function AgeAtDate (const DOB, DT: TDateTime): Integer;

{: Returns the current Age (in years) of a "person" given their Date of Birth
	(DOB) using the System Date. If DOB occurs after the System Date then -1
	is returned.
	@param DOB Date of Birth.
	@returns Age in Integral Years at the current Date.
	@cat DTMath
}
function AgeNow (const DOB: TDateTime): Integer;

{: Returns the Age (in months) of a "person" given their Date of Birth (DOB)
	and the Date of Reference (DT). If DT occurs before DB then -1 is returned.
	Routine donated by David Gobbett.
	@param DOB Date of Birth.
	@param DT Date in question.
	@returns Age in Integral Months at the Date in question.
	@cat DTMath
	@cat MonthMath
	@cat YearMath
}
function AgeAtDateInMonths (const DOB, DT: TDateTime): Integer;

{: Returns the current Age (in months) of a "person" given their Date of Birth
	(DOB) using the System Date. If DOB occurs after the System Date then -1
	is returned.
	Routine donated by David Gobbett.
	@param DOB Date of Birth.
	@returns Age in Integral Months at the current Date.
	@cat DTMath
	@cat MonthMath
}
function AgeNowInMonths (const DOB: TDateTime): Integer;

{: Returns the Age (in weeks) of a "person" given their Date of Birth (DOB)
	and the Date of Reference (DT). If DT occurs before DB then -1 is returned.
	Routine donated by David Gobbett.
	@param DOB Date of Birth.
	@param DT Date in question.
	@returns Age in Integral Weeks at the Date in question.
	@cat DTMath
	@cat WeekMath
}
function AgeAtDateInWeeks (const DOB, DT: TDateTime): Integer;

{: Returns the current Age (in weeks) of a "person" given their Date of Birth (DOB)
	using the System Date. If DOB occurs after the System Date then -1 is returned.
	Routine donated by David Gobbett.
	@param DOB Date of Birth.
	@returns Age in Integral Weeks at the current Date.
	@cat DTMath
	@cat WeekMath
}
function AgeNowInWeeks (const DOB: TDateTime): Integer;

{: Returns the current Age as a Description useful for Hospital Applications.
	Returns Age in weeks if < 2 Months Old, in Months if less than 1 year old
	otherwise in years.
	@param DOB Date of Birth.
	@returns Age as a string.
	@cat DTMath
}
function AgeNowDescr (const DOB: TDateTime): String;

//--- Week No Routines ---

{: Converts Dates into a Week No in the Current Year. Weeks are assumed to
	start with Sunday. The week that Jan 1 occurs is the 1st week of the year,
	the Sunday AFTER Jan 1 would be the start of the 2nd week of the year.
	Note that this does mean that there can be 53 weeks in a year!
	@param DT Date/Time to be processed.
	@cat DTMath
	@cat WeekMath
}
function Date2WeekNo (const DT: TDateTime): Integer;

{: Returns true if the two Dates are in the same WeekNo. Will return false
	if Dates from Different Years.
	@param DT1 First Date/Time to be processed.
	@param DT2 Second Date/Time to be processed.
	@cat DTMath
	@cat WeekMath
	@cat DTComparison
}
function DatesInSameWeekNo (const DT1, DT2: TDateTime): Boolean;

{:Returns true No of Weeks, based on WeekNo, that the two dates are
	apart. A Negative result implies DT2 occurs before D1. Will return -999
	if Dates from Different Years.
	@param DT1 First Date/Time to be processed.
	@param DT2 Second Date/Time to be processed.
	@cat DTMath
	@cat WeekMath
}
function WeekNosApart (const DT1, DT2: TDateTime): Integer;

{: Returns the WeekNo of the current Date (System Date).
	@cat DTMath
	@cat WeekMath
}
function ThisWeekNo: Integer;

{: Returns the Start of the Week for the given WeekNo in the given year,
	assuming that the Start of the Week is Sunday.
	@param WeekNo Week Number in given year.
	@param Year 4 digit year such as 1999.
	@cat DTMath
	@cat WeekMath
}
function StartOfWeekNo (const WeekNo, Year: Word): TDateTime;

{: Returns the End of the Week for the given WeekNo in the given year,
	assuming that the End of the Week is Saturday.
	@param WeekNo Week Number in given year.
	@param Year 4 digit year such as 1999.
	@cat DTMath
	@cat WeekMath
}
function EndOfWeekNo (const WeekNo, Year: Word): TDateTime;

{: Returns the Date for a given Day of Week, a given WeekNo, and the given Year,
	assuming that the Start of the Week is Sunday, and that DOW uses 1 for Sunday.
	@param DOW Day of Week, 1 = Sunday, 7 = Saturday.
	@param WeekNo Week Number in given year.
	@param Year 4 digit year such as 1999.
	@cat DTMath
	@cat WeekMath
}
function DWY2Date (const DOW, WeekNo, Year: Word): TDateTime;

// --- ISO-8601 Compliant Routines ---

{: Returns Day Of Week According to ISO-8601 which has Monday as 1 and
	Sunday as 7.
	@param DT Date/Time to be processed.
	@cat DTMath
	@cat WeekMath
}
function ISODayOfWeek (const DT: TDateTime): Integer;

{: Most years have 52 weeks, but years that start on a Thursday and leap
	years that start on a Wednesday (or Thursday) have 53 weeks. Based on
	code supplied by Niklas Astram.
	@param Year 4-digit year such as 1999.
	@cat WeekMath
	@cat YearMath
}
function ISOWeeksInYear (const Year: Word): Byte;

{: Returns First Monday of the Year, for a given Year. Used in
	ISO-8601 Week No Routines.
	@param Year 4-digit year such as 1999.
	@cat DTMath
	@cat WeekMath
	@cat YearMath
}
function GetFirstMondayOfYear (const Year: Word): TDateTime;

{: Returns the Start of the week containing given Date/Time, assumes that
	the Start of the Week is Monday according to ISO-8601
	- Time portion preserved.
	@param DT Date to process.
	@cat DTMath
	@cat WeekMath
}
function StartOfISOWeek (const DT: TDateTime): TDateTime;

{: Returns the End of the week containing given Date/Time, assumes that
	the End of the Week is Sunday according to ISO-8601
	- Time portion preserved.
	@param DT Date to process.
	@cat DTMath
	@cat WeekMath
}
function EndOfISOWeek (const DT: TDateTime): TDateTime;

{: Converts Dates into a Week No and Year according to ISO-8601. Weeks are
	assumed to start with Monday. The week that Jan 4 occurs in is the 1st week of
	the year. Note that this does mean that there can be 53 weeks in a year!
	@param DT Date to process.
	@param WeekNo Returns the ISO-8601 Week Number in specified Year
	@param Year Returns 4 digit year to which the Week Number applies, not
		necessarily the same year as DT.
	@cat DTMath
	@cat WeekMath
}
procedure Date2ISOWeekNo (const DT: TDateTime; var WeekNo: Byte;
	var Year: Word);

{: Returns Date as a Basic Format for ISO Calendar Week/Day: YYYYWwwD where
	YYYY is year, 'W' is literal, ww is weekno and D is the ISO Day of Week -
	Monday is First Day.
	@param DT Date to take year from.
	@cat WeekMath
	@cat DTConv
}
function Date2ISOWeekStr (const DT: TDateTime): string;

{: Returns Date as a Enhanced Format for ISO Calendar Week/Day: YYYY-Www-D where
	YYYY is year, 'W' is literal, ww is weekno and D is the ISO Day of Week -
	Monday is First Day.
	@param DT Date to process.
	@cat WeekMath
	@cat DTConv
}
function Date2ISOWeekEnhStr (const DT: TDateTime): string;

{: Returns Date as a Basic Format for ISO Calendar Week: YYYYWww where
	YYYY is year, 'W' is literal, ww is weekno.
	@param DT Date to process.
	@cat WeekMath
	@cat DTConv
}
function Date2ISOWeekOnlyStr (const DT: TDateTime): string;

{: Returns Date as a Enhanced Format for ISO Calendar Week: YYYY-Www where
	YYYY is year, 'W' is literal, ww is weekno.
	@param DT Date to process.
	@cat WeekMath
	@cat DTConv
}
function Date2ISOWeekOnlyEnhStr (const DT: TDateTime): string;

{: Returns Date as a Basic Format for ISO Dates: YYYYMMDD where
	YYYY is year, MM is the Month, DD is Day of Month. Zero Padded.
	@param DT Date to process.
	@cat DTConv
}
function Date2ISOStr (const DT: TDateTime): string;

{: Returns Date as a Basic Format for ISO Dates: YYYY-MM-DD where
	YYYY is year, MM is the Month, DD is Day of Month. Zero Padded.
	@param DT Date to process.
	@cat DTConv
}
function Date2ISOEnhStr (const DT: TDateTime): string;

{: Returns Date as a Basic Format for ISO Dates: YYYYMMDD where
	YYYY is year, MM is the Month, DD is Day of Month. Zero Padded.
	@param DT Date to process.
	@cat DTConv
}
function Date2ISOInt (const DT: TDateTime): Cardinal;

{Returns true if the two Dates are in the same ISO-8601 WeekNo.
	@param DT1 First Date to process.
	@param DT2 Second Date to process.
	@cat DTMath
	@cat WeekMath
	@cat DTComparison
}
function DatesInSameISOWeekNo (const DT1, DT2: TDateTime): Boolean;

{Returns true No of Weeks, based on ISOWeekNo, that the two dates are
	apart. A Negative result implies DT2 occurs before D1.
	@param DT1 First Date to process.
	@param DT2 Second Date to process.
	@cat DTMath
	@cat WeekMath
}
function ISOWeekNosApart (DT1, DT2: TDateTime): Integer;

{: Returns the ISO-8601 WeekNo of the current Date (System Date).
	@param WeekNo Returns the ISO-8601 Week Number in specified Year
	@param Year Returns 4 digit year to which the Week Number applies.
	@cat DTMath
	@cat WeekMath
}
procedure ThisISOWeekNo (var WeekNo: Byte; var Year: Word);

{: Returns the Start of the Week for the given ISO-8601 WeekNo in the given
	year. Note that the Start of the Week is Monday in ISO-8601.
	@param WeekNo Returns the ISO-8601 Week Number in specified Year
	@param Year Returns 4 digit year to which the Week Number applies.
	@cat DTMath
	@cat WeekMath
}
function StartOfISOWeekNo (const WeekNo, Year: Word): TDateTime;

{: Returns the End of the Week for the given ISO-8601 WeekNo in the given
	year. Note that the End of the Week is Sunday in ISO-8601.
	@param WeekNo Returns the ISO-8601 Week Number in specified Year.
	@param Year Returns 4 digit year to which the Week Number applies.
	@cat DTMath
	@cat WeekMath
}
function EndOfISOWeekNo (const WeekNo, Year: Word): TDateTime;

{: Returns the Date for a given Day of Week, a given WeekNo, and the given Year,
	as defined in ISO-8601. Note that the Start of the Week is Monday, and
	that DOW uses 1 for Monday.
	@param Year 4 digit year to which the Week Number applies.
	@param WeekNo the ISO-8601 Week Number in specified Year.
	@param DOW Day of Week, 1 for Monday through 7 for Sunday.
	@cat DTMath
	@cat WeekMath
}
function ISOYWD2Date (const Year: Word; const WeekNo, DOW: Byte): TDateTime;

//--- Boolean Identification ---

{: Returns True if they are both the same Date ignoring the Time portion.
	@param DT1 First Date to process.
	@param DT2 Second Date to process.
	@cat DTComparison
}
function SameDate (const DT1, DT2: TDateTime): Boolean;

{: Returns True if they are both the same Time ignoring the Date portion.
	Times are considered the same if they are less then 1 millisecond apart.
	@param DT1 First Time to process.
	@param DT2 Second Time to process.
	@cat DTComparison
}
function SameTime (const DT1, DT2: TDateTime): Boolean;

{: Returns True if they are both the same Date/Time. Date/Times are considered
	the same if they are less then 1 millisecond apart.
	@param DT1 First Date/Time to process.
	@param DT2 Second Date/Time to process.
	@cat DTComparison
}
function SameDateTime (const DT1, DT2: TDateTime): Boolean;

{: Returns True if the given Date's Month is January.
	@param DT Date to process.
	@cat DTComparison
}
function IsJanuary (const DT: TDateTime): Boolean;

{: Returns True if today's Month is January.
	@cat DTComparison
}
function IsJanuaryNow: Boolean;

{: Returns True if the given Date's Month is February.
	@param DT Date to process.
	@cat DTComparison
}
function IsFebruary (const DT: TDateTime): Boolean;

{: Returns True if today's Month is February.
	@cat DTComparison
}
function IsFebruaryNow: Boolean;

{: Returns True if the given Date's Month is March.
	@param DT Date to process.
	@cat DTComparison
}
function IsMarch (const DT: TDateTime): Boolean;

{: Returns True if today's Month is March.
	@cat DTComparison
}
function IsMarchNow: Boolean;

{: Returns True if the given Date's Month is April.
	@param DT Date to process.
	@cat DTComparison
}
function IsApril (const DT: TDateTime): Boolean;

{: Returns True if today's Month is April.
	@cat DTComparison
}
function IsAprilNow: Boolean;

{: Returns True if the given Date's Month is May.
	@param DT Date to process.
	@cat DTComparison
}
function IsMay (const DT: TDateTime): Boolean;

{: Returns True if today's Month is May.
	@cat DTComparison
}
function IsMayNow: Boolean;

{: Returns True if the given Date's Month is June.
	@param DT Date to process.
	@cat DTComparison
}
function IsJune (const DT: TDateTime): Boolean;

{: Returns True if today's Month is June.
	@cat DTComparison
}
function IsJuneNow: Boolean;

{: Returns True if the given Date's Month is July.
	@param DT Date to process.
	@cat DTComparison
}
function IsJuly (const DT: TDateTime): Boolean;

{: Returns True if today's Month is July.
	@cat DTComparison
}
function IsJulyNow: Boolean;

{: Returns True if the given Date's Month is August.
	@param DT Date to process.
	@cat DTComparison
}
function IsAugust (const DT: TDateTime): Boolean;

{: Returns True if today's Month is August.
	@cat DTComparison
}
function IsAugustNow: Boolean;

{: Returns True if the given Date's Month is September.
	@param DT Date to process.
	@cat DTComparison
}
function IsSeptember (const DT: TDateTime): Boolean;

{: Returns True if today's Month is September.
	@cat DTComparison
}
function IsSeptemberNow: Boolean;

{: Returns True if the given Date's Month is October.
	@param DT Date to process.
	@cat DTComparison
}
function IsOctober (const DT: TDateTime): Boolean;

{: Returns True if today's Month is October.
	@cat DTComparison
}
function IsOctoberNow: Boolean;

{: Returns True if the given Date's Month is November.
	@param DT Date to process.
	@cat DTComparison
}
function IsNovember (const DT: TDateTime): Boolean;

{: Returns True if today's Month is November.
	@cat DTComparison
}
function IsNovemberNow: Boolean;

{: Returns True if the given Date's Month is December.
	@param DT Date to process.
	@cat DTComparison
}
function IsDecember (const DT: TDateTime): Boolean;

{: Returns True if todays Month is December.
	@cat DTComparison
}
function IsDecemberNow: Boolean;

{: Returns True if the Time portion is a AM value.
	@param DT Time to process.
	@cat DTComparison
}
function IsAM (const DT: TDateTime): Boolean;

{: Returns True if the currnet Time is a AM value.
	@cat DTComparison
}
function IsAMNow: Boolean;

{: Returns True if the Time portion is a PM value.
	@param DT Time to process.
	@cat DTComparison
}
function IsPM (const DT: TDateTime): Boolean;

{: Returns True if the current Time is a PM value.
	@cat DTComparison
}
function IsPMNow: Boolean;

{: Returns True if the Time portion represents Noon, 12:00pm.
	@param DT Time to process.
	@cat DTComparison
}
function IsNoon (const DT: TDateTime): Boolean;

{: Returns True if the current Time represents Noon, 12:00pm.
	@cat DTComparison
}
function IsNoonNow: Boolean;

{: Returns True if the Time portion represents Midnight, 12:00am.
	@param DT Time to process.
	@cat DTComparison
}
function IsMidnight (const DT: TDateTime): Boolean;

{: Returns True if the current Time represents Midnight, 12:00am.
	@cat DTComparison
}
function IsMidnightNow: Boolean;

{: Returns True if the Date represents a Sunday.
	@param DT Time to process.
	@cat DTComparison
}
function IsSunday (const DT: TDateTime): Boolean;

{: Returns True if today is a Sunday.
	@cat DTComparison
}
function IsSundayNow: Boolean;

{: Returns True if the Date represents a Monday.
	@param DT Date to process.
	@cat DTComparison
}
function IsMonday (const DT: TDateTime): Boolean;

{: Returns True if today is a Monday.
	@cat DTComparison
}
function IsMondayNow: Boolean;

{: Returns True if the Date represents a Tuesday.
	@param DT Date to process.
	@cat DTComparison
}
function IsTuesday (const DT: TDateTime): Boolean;

{: Returns True if today is a Tuesday.
	@cat DTComparison
}
function IsTuesdayNow: Boolean;

{: Returns True if the Date represents a Wednesday.
	@param DT Date to process.
	@cat DTComparison
}
function IsWednesday (const DT: TDateTime): Boolean;

{: Returns True if today is a Wednesday.
	@cat DTComparison
}
function IsWednesdayNow: Boolean;

{: Returns True if the Date represents a Thursday.
	@param DT Date to process.
	@cat DTComparison
}
function IsThursday (const DT: TDateTime): Boolean;

{: Returns True if today is a Thursday.
	@cat DTComparison
}
function IsThursdayNow: Boolean;

{: Returns True if the Date represents a Friday.
	@param DT Date to process.
	@cat DTComparison
}
function IsFriday (const DT: TDateTime): Boolean;

{: Returns True if today is a Friday.
	@cat DTComparison
}
function IsFridayNow: Boolean;

{: Returns True if the Date represents a Saturday.
	@param DT Date to process.
	@cat DTComparison
}
function IsSaturday (const DT: TDateTime): Boolean;

{: Returns True if today is a Saturday.
	@cat DTComparison
}
function IsSaturdayNow: Boolean;

{: Returns True if the Date represents Saturday or Sunday.
	@param DT Date to process.
	@cat DTComparison
}
function IsWeekend (const DT: TDateTime): Boolean;

{: Returns True if today is Saturday or Sunday.
	@cat DTComparison
}
function IsWeekendNow: Boolean;

{: Returns True if the Date represents Monday through Friday.
	@param DT Date to process.
	@cat DTComparison
}
function IsWeekday (const DT: TDateTime): Boolean;

{: Returns True if today is Monday through Friday.
	@cat DTComparison
}
function IsWeekdayNow: Boolean;

{: Returns True if Month can be found in the Short Months from the
	Regional Settings.
	@param Month String containing Month Name
	@cat DTComparison
	@cat MonthMath
}
function IsValidShortMonth (const Month: string): Boolean;

{: Returns True if Month can be found in the Long Months from the
	Regional Settings.
	@param Month String containing Month Name
	@cat DTComparison
	@cat MonthMath
}
function IsValidLongMonth (const Month: string): Boolean;

{: Returns True if DOW can be found in the Short Day Names from the
	Regional Settings.
	@param Month String containing Day of Week Name
	@cat DTComparison
}
function IsValidShortDOW (const DOW: string): Boolean;

{: Returns True if DOW can be found in the Long Day Names from the
	Regional Settings.
	@param Month String containing Day of Week Name
	@cat DTComparison
}
function IsValidLongDOW (const DOW: string): Boolean;

{: Returns true if the date is the first day of a Month.
	@param DT Date to process.
	@cat DTComparison
	@cat MonthMath
}
function IsFirstDayOfMonth (const DT: TDateTime): Boolean;

{: Returns true if today is the first day of a Month.
	@cat DTComparison
	@cat MonthMath
}
function IsFirstDayOfMonthNow: Boolean;

{: Returns true if the date is the last day of a Month.
	@param DT Date to process.
	@cat DTComparison
	@cat MonthMath
}
function IsLastDayOfMonth (const DT: TDateTime): Boolean;

{: Returns true if today is the last day of a Month.
	@cat DTComparison
	@cat MonthMath
}
function IsLastDayOfMonthNow: Boolean;

{: Returns true if the date is the first day of a Year.
	@param DT Date to process.
	@cat DTComparison
	@cat YearMath
}
function IsFirstDayOfYear (const DT: TDateTime): Boolean;

{: Returns true if today is the first day of a Year.
	@cat DTComparison
	@cat YearMath
}
function IsFirstDayOfYearNow: Boolean;

{: Returns true if the date is the last day of a Year.
	@param DT Date to process.
	@cat DTComparison
	@cat YearMath
}
function IsLastDayOfYear (const DT: TDateTime): Boolean;

{: Returns true if today is the last day of a Year.
	@cat DTComparison
	@cat YearMath
}
function IsLastDayOfYearNow: Boolean;

//--- TimeZone Routines ---

{: Returns the Local TimeZone Bias, in Minutes, taking into account Standard
	and/or Daylight Biases, from the Regional Settings.
	@cat SystemOps
}
function GetLocalTZBias: LongInt;

{: Sets the Local TimeZone Bias, in Minutes, taking into account current Standard
	and/or Daylight Biases, from the Regional Settings.

	<B>BE CAREFUL</B> when changing Regional Setting. Best to call <See Routine=GetLocalTZBias>
	first so you can reset the value. This causes changes to your System's
	Regional Settings.<p>

	<B>WARNING.</B> You can seriously mess up your compute with this routine!<p>

	If messed up go to Control Panel Date/Time Applet, choose another Time
	Zone, Apply it, change back to your Time Zone, Apply it,
	fix the date/time, and apply it.
	@param BIAS Amount of minutes to add to local time to get GMT/UTC.
	@cat SystemOps
}
procedure SetLocalTZBias (const Bias: Longint);

{: Returns the TimeZone Name from the Regional Settings.
	@cat SystemOps
}
function GetTimeZoneName: string;

{: Returns the Difference from GMT (Greenwich Mean Time) as a string. For
	example mine is "GMT+8".
	@cat SystemOps
}
function GetGMTDifference: string;

{: Returns the GMT string as a value. For example mine is "GMT+8" would return 8.0.
	Must contain a '+' or '-' sign, the 'GMT' is actually ignored currently,
	though this may change in the future.
	@cat SystemOps
}
function GMTStr2Value(const GMTStr: string): Extended;

{: Uses Regional Strings to determine your TimeZone and returns the
	Date/Time given (taken as being in your Time Zone) as GMT (Greenwich
	Mean Time) based
	@param DT Local Date/Time.
	@returns GMT Date/Time Equivalent.
	@cat SystemOps
	@cat DTMath
}
function GetGMTTime (const DT: TDateTime): TDateTime;

{: Uses Regional Strings to determine your TimeZone and returns the
	Date/Time given (taken as being in GMT) as Local Time based.
	@param DT GMT Date/Time.
	@returns Local Date/Time Equivalent.
	@cat SystemOps
	@cat DTMath
}
function GetLocalTime (const DT: TDateTime): TDateTime;

{: Converts a Given Date/Time based on FromGMTStr (e.g. GMT+4) and returns
	a Date/Time using the ToGMTStr (e.g. GMT-5).
	@param FromGMTStr GMTStr describing source Time Zone.
	@param FromDT Date/Time to conver from.
	@param ToGMTStr GMTStr describing destination Time Zone.
	@returns Date/Time Equivalent in ToGMTStr.
	@cat SystemOps
	@cat DTMath
}
function ConvertGMTStrTimes (const FromGMTStr: string; const FromDT: TDateTime;
	const ToGMTStr: string): TDateTime;

{: Returns the Current Date and Time as at GMT/UTC.
	@cat SystemOps
	@cat DTMath
}
function GMTNow: TDateTime;

{: Returns the Current Date as at GMT/UTC.
	@cat SystemOps
	@cat DTMath
}
function GMTDate: TDateTime;

{: Returns the Current Date as at GMT/UTC.
	@cat SystemOps
	@cat DTMath
}
function GMTTime: TDateTime;

{: Returns the Difference from UTC (Universal Time/Greenwich Mean Time) as a string,
	following the RFC822 Standard. For example mine is "(+0800)".
	@cat SystemOps
	@cat DTConv
}
function GetRFC822Difference: string;

{: Returns the RFC822 string as a value. For example mine is "+0800" would return 8.0.
	Must be a valid RFC822 string else 0 is returned.
	Includes Support for GMT / UT / EST / EDT / CST / CDT / MST / MDT
	/ PST / PDT and Military Z / A / M / N / Y.
	@cat SystemOps
	@cat DTConv
}
function RFC822Value(const RFC822: string): Extended;

{: Converts a Given Date/Time based on FromRFC822 (e.g. +0400) and returns
	a Date/Time using the ToRFC822 (e.g. EST).
	Includes Support for GMT / UT / EST / EDT / CST / CDT / MST / MDT
	/ PST / PDT and Military Z / A / M / N / Y.
	@param FromRFC822 RFC822 String describing source Time Zone.
	@param FromDT Date/Time to conver from.
	@param ToRFC822 RFC822 String describing destination Time Zone.
	@returns Date/Time Equivalent in ToRFC822.
	@cat SystemOps
	@cat DTMath
}
function ConvertRFC822Times (const FromRFC822: string; const FromDT: TDateTime;
	const ToRFC822: string): TDateTime;

{-- Windows Based Routines ---}

{$IFDEF D4PLUS}
{: This is a function which converts a Date/Time to a Large_Int (as defined
	in Windows API. It's useful in a SetWaitableTimer (NT API) function for example.
	Donated by Damien Racca.
}
function DateTimeToLargeInteger (const DT: TDateTime): Large_Integer;

{: Converts an 8 byte File Time (used in Win32 API) into a Delphi
	Date/Time. Donated by J. Peter Mugaas.
	@param FT File Time to process.
	@cat DTMath
}
function FileTime2DateTime (const FT: TFileTime): TDateTime;

{: Converts a Delphi Date/Time into  an 8 byte File Time (used in
	Win32 API. Donated by J. Peter Mugaas.
	@param DT Date to process.
	@cat DTMath
}
function DateTime2FileTime (const DT: TDateTime): TFileTime;
{$ENDIF}

{: Returns Date as a string suitable for MS Access Date comparisons,
	ie #MM/DD/YYYY#.
	@param DT Date to process.
	@cat DTConv
}
function Date2AccessStr (const DT: TDateTime): String;

(*: Returns Date as a string suitable for ANSI Standard comparisons,
	ie  { d 'YYYY-MM-DD' }
	@param DT Date to process.
	@cat DTConv
*)
function Date2ANSISQLStr (const DT: TDateTime): String;

implementation

uses
	{$IFDEF UseESBRoutines}
	ESBRtns,
	{$ENDIF}
	SysUtils;

{$IFNDEF UseESBRoutines}
// --- Routines taken from ESBRoutines ---

function LInt2EStr (const L: LongInt): String;
begin
	try
		Result := IntToStr (L);
	except
		Result := '';
	end;
end;

function LeftStr (const S : string; const N : Integer): string;
begin
	Result := Copy (S, 1, N);
end;

function RightAfterStr (const S : String; const N : Integer): String;
begin
	Result := Copy (S, N + 1, Length (S) - N );
end;

function FillStr (const Ch : Char; const N : Integer): string;
begin
	SetLength (Result, N);
	FillChar (Result [1], N, Ch);
end;

function PadChLeftStr (const S : string; const Ch : Char;
	const Len : Integer): string;
var
	N: Integer;
begin
	N := Length (S);
	if N < Len then
		Result := FillStr (Ch, Len - N) + S
	else
		Result := S;
end;

function LInt2ZStr (const L: LongInt; const Len: Byte): String;
begin
	Result := LInt2EStr (L);
	Result := PadChLeftStr (LeftStr (Result, Len), '0', Len);
end;

function ReplaceChStr (const S : string;
	const OldCh, NewCh : Char): string;
var
	I: Integer;
begin
	Result := S;
	if OldCh = NewCh then
		Exit;
	for I := 1 to Length (S) do
		if S [I] = OldCh then
			Result [I] := NewCh;
end;

function Str2Ext (const S: String): Extended;
begin
	try
		Result := StrToFloat (S);
	except
		Result := 0;
	end;
end;

function Str2Lint (const S: String): LongInt;
begin
	try
		Result := StrToInt (S);
	except
		Result := 0;
	end;
end;
// --- End Routines taken from ESBRoutines ---
{$ENDIF}

function IsLeapYear (Year: Word): Boolean;
begin
	Result := ((Year and 3) = 0) and ((Year mod 100 > 0) or (Year mod 400 = 0))
end;

function Date2Str (const DT: TDateTime): String;
begin
	try
		if abs (DT) < OneDTMillisecond then
			Result := ''
		else
			Result := DateToStr (DT);
	except
		Result := '';
	end;
end;

function Time2Str (const DT: TDateTime): String;
var
	Hrs, Mins, Secs, MSecs: Word;
begin
	if abs (DT) < OneDTMillisecond then
		Result := ''
	else
		try
			DecodeTime (DT, Hrs, Mins, Secs, MSecs);
			Result := LInt2EStr (Hrs) + FormatSettings.TimeSeparator
				+ LInt2ZStr (Mins, 2);
		except
			Result := '';
		end;
end;

function Date2Year (const DT: TDateTime): Word;
var
	D, M: Word;
begin
	OptDecodeDateW (DT, Result, M, D);
end;

function Date2Month (const DT: TDateTime): Word;
var
	D, Y : Word;
begin
	OptDecodeDateW (DT, Y, Result, D);
end;

function Date2Day (const DT: TDateTime): Word;
var
	M, Y : Word;
begin
	OptDecodeDateW (DT, Y, M, Result);
end;

function Time2Hr (const DT: TDateTime): Word;
var
	Min, Sec, MSec: Word;
begin
	DecodeTime (DT, Result, Min, Sec, MSec);
end;

function Time2Min (const DT: TDateTime): Word;
var
	Hr, Sec, MSec: Word;
begin
	DecodeTime (DT, Hr, Result, Sec, MSec);
end;

function Time2Sec (const DT: TDateTime): Word;
var
	Hr, Min, MSec: Word;
begin
	DecodeTime (DT, Hr, Min, Result, MSec);
end;

function Time2MSec (const DT: TDateTime): Word;
var
	Hr, Min, Sec: Word;
begin
	DecodeTime (DT, Hr, Min, Sec, Result);
end;

function MinutesApart (const DT1, DT2: TDateTime): Word;
var
	Hr1, Min1, Sec1, MSec1: Word;
	Hr2, Min2, Sec2, MSec2: Word;
begin
	DecodeTime (DT1, Hr1, Min1, Sec1, MSec1);
	DecodeTime (DT2, Hr2, Min2, Sec2, MSec2);
	if Min2 < Min1 then
	begin
		Min2 := Min2 + 60;
		Dec (Hr2);
	end;
	if Hr1 > Hr2 then
		Hr2 := Hr2 + 24;
	Result := (Hr2 - Hr1) * 60 + (Min2 - Min1);
end;

function TimeApartInFortnights (const DT1, DT2: TDateTime): Extended;
begin
	if SameDateTime (DT1, DT2) then
		Result := 0
	else
		Result := (DT2 - DT1) / 14;
end;

function TimeApartInWeeks (const DT1, DT2: TDateTime): Extended;
begin
	if SameDateTime (DT1, DT2) then
		Result := 0
	else
		Result := (DT2 - DT1) / 7;
end;

function TimeApartInDays (const DT1, DT2: TDateTime): Extended;
begin
	if SameDateTime (DT1, DT2) then
		Result := 0
	else
		Result := (DT2 - DT1);
end;

function TimeApartInHrs (const DT1, DT2: TDateTime): Extended;
begin
	if SameDateTime (DT1, DT2) then
		Result := 0
	else
		Result := (DT2 - DT1) * 24;
end;

function TimeApartInMins (const DT1, DT2: TDateTime): Extended;
begin
	if SameDateTime (DT1, DT2) then
		Result := 0
	else
		Result := (DT2 - DT1) * 24 * 60;
end;

function TimeApartInSecs (const DT1, DT2: TDateTime): Extended;
begin
	if SameDateTime (DT1, DT2) then
		Result := 0
	else
		Result := (DT2 - DT1) * 24 * 60 * 60;
end;

function MS2TimeStr (const MS: LongInt): String;
var
	L: LongInt;
begin
	L := MS;
	Result := '.' + LInt2ZStr (L mod 1000, 3);
	L := L div 1000;
	Result := ':' + LInt2ZStr (L mod 60, 2) + Result;
	L := L div 60;
	Result := ':' + LInt2ZStr (L mod 60, 2) + Result;
	L := L div 60;
	Result := LInt2EStr (L) + Result ;
end;

function AdjustDateYear (const D: TDateTime; const Year: Word): TDateTime;
var
	Day, Month, OldYear: Word;
begin
	OptDecodeDateW (D, OldYear, Month, Day);
	if Year = OldYear then
	begin
		Result := Int (D);
		Exit;
	end;
	if not IsLeapYear (Year) and (Month = 2) and (Day = 29) then
	begin
		Month := 3;
		Day := 1;
	end;
	Result := OptEncodeDateW (Year, Month, Day);
end;

function GetDateTimeStamp: String;
var
	DT: TDateTime;
	Year, Month, Day: Word;
	Hr, Min, Sec, MSec: Word;
begin
	DT := Now;
	OptDecodeDateW (DT, Year, Month, Day);
	DecodeTime (DT, Hr, Min, Sec, MSec);
	Result := LInt2ZStr (Year, 4) + LInt2ZStr (Month, 2) +
		LInt2ZStr (Day, 2) + '-' + LInt2ZStr (Hr, 2) +
		LInt2ZStr (Min, 2) + LInt2ZStr (Sec, 2) + Lint2ZStr (MSec, 3);
end;

function Str2Time (S: String): TDateTime;
begin
	if S = '' then
	begin
		Result := 0.0;
		Exit;
	end;

	try
		// Allow '.' and ':' as valid alternatives for TimeSeparator
		S := ReplaceChStr ( S, '.', FormatSettings.TimeSeparator);
		S := ReplaceChStr ( S, ':', FormatSettings.TimeSeparator);

		// Remove trailing Separator if any
		if S [Length (S)] = FormatSettings.TimeSeparator then
		begin
			S := LeftStr (S, Length (S) - 1);
			if S = '' then
			begin
				Result := 0.0;
				Exit;
			end;
		end;

		//Frac ensures the Date Component is 0
		Result := Frac (StrToTime (S));
	except
		Result := 0.0;
	end;
end;

type
	TDateOrder = (doMDY, doDMY, doYMD, doUnknown);

function GetDateOrder (const DateFormat: string): TDateOrder;
var
	I: Integer;
begin
	Result := doMDY;
	I := 1;
	while I <= Length(DateFormat) do
	begin
		case char (Ord (DateFormat[I]) and $DF) of
			'E': Result := doYMD;
			'Y': Result := doYMD;
			'M': Result := doMDY;
			'D': Result := doDMY;
		else
			Inc(I);
			Continue;
		end;
		Exit;
	end;
	Result := doMDY;
end;

{---}

function Str2Date (S: String): TDateTime;
var
	P1, P2: Integer;
	Yr: Word;
	DateOrder: TDateOrder;
begin
	if S = '' then
	begin
		Result := 0.0;
		Exit;
	end;

	try
		// Allow '-' and '/' as valid alternatives for DateSeparator
		S := ReplaceChStr ( S, '-', FormatSettings.DateSeparator);
		S := ReplaceChStr ( S, '/', FormatSettings.DateSeparator);

		// Remove trailing Separator if any
		if S [Length (S)] = FormatSettings.DateSeparator then
		begin
			S := LeftStr (S, Length (S) - 1);
			if S = '' then
			begin
				Result := 0.0;
				Exit;
			end;
		end;

		DateOrder := GetDateOrder(FormatSettings.ShortDateFormat);
		P1 := Pos (FormatSettings.DateSeparator, S);
		if P1 > 0 then // If at least one Date Separator
		begin
			P2 := Pos (FormatSettings.DateSeparator, Copy (S, P1 + 1, Length (S) - P1));
			if P2 > 0 then // If 2 Date Separators
			begin
				// Get Components
				case DateOrder of
					doMDY, doDMY:
					begin
						Yr := Str2LInt (Copy (S, P1 + P2 + 1, Length (S) - (P1 + P2)));
					end;
				else
					begin
						Yr := Str2Lint (LeftStr (S, P1 - 1));
					end;
				end;

				if Yr < 100 then // If 2 Digit
				begin
					case ESB2DigitYr of
						// edyNone - Nothing has to be done
						edyCutOff: // Process using ESB2DigitCutOff
						begin
							if 1900 + Yr < ESB2DigitCutOff then
								Yr := 2000 + Yr
							else
								Yr := 1900 + Yr
						end;
						edyHistoric: // Take Yr as this year or earlier
						begin
							if 2000 + Yr <= ThisYear then
								Yr := 2000 + Yr
							else
								Yr := 1900 + Yr;
						end;
					end;
				end;
					// Rebuild String
				case DateOrder of
					doMDY, doDMY:
					begin
						S := LeftStr (S, P1 + P2) + LInt2EStr (Yr);
					end;
					doYMD:
					begin
						S := LInt2EStr (Yr) + RightAfterStr (S, P1 - 1);
					end;
				end;
			end
			else
			begin
				// Assume This Year is implied
				case DateOrder of
					doMDY, doDMY:
					begin
						S := S + FormatSettings.DateSeparator + LInt2EStr (ThisYear)
					end;
					doYMD:
					begin
						S := LInt2EStr (ThisYear) + FormatSettings.DateSeparator + S;
					end;
				end;
			end;
		end
		else
		begin
			// Assume This Month and Year are implied
			case DateOrder of
				doDMY:
				begin
					S := S + FormatSettings.DateSeparator + LInt2EStr (ThisMonth)
						+ FormatSettings.DateSeparator + LInt2EStr (ThisYear);
				end;
				doMDY:
				begin
					S := LInt2EStr (ThisMonth) + FormatSettings.DateSeparator + S
						+ FormatSettings.DateSeparator + LInt2EStr (ThisYear);
				end;
				doYMD:
				begin
					S := LInt2EStr (ThisYear) + FormatSettings.DateSeparator +
						LInt2EStr (ThisMonth) + FormatSettings.DateSeparator + S;
				end;
			end;
		end;

		//Int ensures the fractional Component is 0
		Result := Int (StrToDate (S));
	except
		Result := 0.0;
	end;
end;

function Str2HistoricDate (S: String): TDateTime;
var
	Hold: TESB2DigitYr;
begin
	Hold := ESB2DigitYr;
	ESB2DigitYr := edyHistoric;
	Result := Str2Date (S);
	ESB2DigitYr := Hold;
end;

function Str2CutoffDate (S: string; const CutOff: Word): TDateTime;
var
	Hold1: TESB2DigitYr;
	Hold2: Word;
begin
	Hold1 := ESB2DigitYr;
	Hold2 := ESB2DigitCutOff;
	ESB2DigitYr := edyCutOff;
	ESB2DigitCutOff := CutOff;
	Result := Str2Date (S);
	ESB2DigitYr := Hold1;
	ESB2DigitCutOff := Hold2;
end;

function AddSecs (const DT: TDateTime; const Secs: Extended): TDateTime;
begin
	Result := DT + Secs * OneDTSecond
end;

function AddMins (const DT: TDateTime; const Mins: Extended): TDateTime;
begin
	Result := DT + Mins * OneDTMinute
end;

function AddHrs (const DT: TDateTime; const Hrs: Extended): TDateTime;
begin
	Result := DT + Hrs * OneDTHour;
end;

function AddWeeks (const DT: TDateTime; const Weeks: Extended): TDateTime;
begin
	Result := DT + Weeks * 7;
end;

function AddFortnights (const DT: TDateTime; const FNights: Extended): TDateTime;
begin
	Result := AddWeeks (DT, FNights * 2);
end;

function AddMonths (const DT: TDateTime; const Months: Extended): TDateTime;
var
	Day, Month, Year: Word;
	IMonth: Integer;
begin
	OptDecodeDateW (DT, Year, Month, Day);
	IMonth := Month + Trunc (Months);

	if IMonth > 12 then
	begin
		Year := Year + (IMonth - 1) div 12;
		IMonth := IMonth mod 12;
		if IMonth = 0 then
			IMonth := 12;
	end
	else if IMonth < 1 then
	begin
		Year := Year + (IMonth div 12) - 1; // sub years;
		IMonth := 12 - abs (IMonth) mod 12;
	end;
     Month := IMonth;

	// Ensure Day of Month is valid
	if Month = 2 then
	begin
		if IsLeapYear (Year) and (Day > 29) then
			Day := 29
		else	if not IsLeapYear (Year) and (Day > 28) then
			Day := 28;
	end
	else if (Month in [9, 4, 6, 11]) and (Day = 31) then
		Day := 30;

	Result := OptEncodeDateW (Year, Month, Day) + Frac (Months) * 30 +
		Frac (DT);
end;

function AddQuarters (const DT: TDateTime; const Qtrs: Extended): TDateTime;
begin
	Result := AddMonths (DT, Qtrs * 3);
end;

function AddSemesters (const DT: TDateTime; const Sems: Extended): TDateTime;
begin
	Result := AddMonths (DT, Sems * 6);
end;

function AddYrs (const DT: TDateTime; const Yrs: Extended): TDateTime;
var
	Day, Month, Year: Word;
begin
	OptDecodeDateW (DT, Year, Month, Day);
	Year := Year + Trunc (Yrs);
	if not IsLeapYear (Year) and (Month = 2) and (Day = 29) then
		Day := 28;
	Result := OptEncodeDateW (Year, Month, Day) + Frac (Yrs) * 365.25
		+ Frac (DT);
end;

function GetLocalTZBias: LongInt;
var
	TZ : TTimeZoneInformation;
begin
	case GetTimeZoneInformation (TZ) of
		TIME_ZONE_ID_STANDARD: Result := TZ.Bias + TZ.StandardBias;
		TIME_ZONE_ID_DAYLIGHT: Result := TZ.Bias + TZ.DaylightBias;
	else
		Result := TZ.Bias;
	end;
end;

function GetGMTTime (const DT: TDateTime): TDateTime;
begin
	Result := DT + GetLocalTZBias * OneDTMinute;
end;

function GetLocalTime (const DT: TDateTime): TDateTime;
begin
	Result := DT - GetLocalTZBias * OneDTMinute;
end;

function GetTimeZoneName: string;
var
	TZ : TTimeZoneInformation;
begin
	case GetTimeZoneInformation (TZ) of
		TIME_ZONE_ID_STANDARD: Result := WideCharToString (TZ.StandardName);
		TIME_ZONE_ID_DAYLIGHT: Result := WideCharToString (TZ.DaylightName);
	else
		Result := '';
	end;
end;

function GetGMTDifference: string;
var
	TZ : TTimeZoneInformation;
begin
	GetTimeZoneInformation (TZ);
	if TZ.Bias = 0 then
		Result := 'GMT'
	else if TZ.Bias < 0 then
	begin
		if TZ.Bias mod 60 = 0 then
			Result := 'GMT+' + IntToStr (Abs (TZ.Bias) div 60)
		else
			Result := 'GMT+' + FloatToStr (Abs (TZ.Bias) / 60)
	end
	else
	begin
		if TZ.Bias mod 60 = 0 then
			Result := 'GMT-' + IntToStr (TZ.Bias div 60)
		else
			Result := 'GMT-' + FloatToStr (TZ.Bias / 60)
	end
end;

function GetLastDayofMonth (const DT: TDateTime): TDateTime;
var
	D, M, Y: Word;
begin
	optDecodeDateW (DT, Y, M, D);
	case M of
		2:
		begin
			if IsLeapYear (Y) then
				D := 29
			else
				D := 28;
		end;
		4, 6, 9, 11: D := 30
		else
			D := 31;
	end;
	Result := optEncodeDateW (Y, M, D) + Frac (DT);
end;

function GetFirstDayofMonth (const DT: TDateTime): TDateTime;
var
	D, M, Y: Word;
begin
	OptDecodeDateW (DT, Y, M, D);
	Result := OptEncodeDateW (Y, M, 1) + Frac (DT);
end;

function GetGoldenNumber (const Year: Word): Integer;
begin
	Result := Year mod 19 + 1;
end;

function GetEpact (const Year: Word): Integer;
var
	Century: Integer;
begin
	Century := Year div 100 + 1;
	Result := ((11 * (GetGoldenNumber (Year) - 1)) mod 30
		+ (8 * Century + 5) div 25) - (3 * Century) div 4  + 8;
	while Result < 1 do
		Result := Result + 30;
	while Result > 30 do
		Result := Result - 30;
end;

function GetEasterSunday (const Year: Word): TDateTime;
var
	C, I, J, H, G, L: Integer;
	D, M: Word;
begin
	G := GetGoldenNumber (Year) - 1;
	C := Year div 100;
	H := (C - C div 4 - (8 * C + 13) div 25 + 19 * G + 15) mod 30;
	I := H - (H div 28) * (1 - (H div 28) * (29 div (H + 1))*((21 - G) div 11));
	J := (Year + Year div 4 + I + 2 - C + C div 4) mod 7;

	L := I - J;
	M := 3 + (L + 40) div 44;
	D := L + 28 - 31 * (M div 4);
	Result := OptEncodeDateW (Year, M, D);
end;

function GetGoodFriday (const Year: Word): TDateTime;
begin
	Result := GetEasterSunday (Year) - 2;
end;

function GMTStr2Value(const GMTStr: string): Extended;
var
	P: Integer;
begin
	P := Pos (GMTStr, '+');
	if P > 0 then
	begin
		Result := Str2Ext (Trim (Copy (GMTStr, P + 1, Length (GMTStr) - P)));
	end
	else
	begin
		P := Pos (GMTStr, '-');
		if P > 0 then
		begin
			Result := -1 * Str2Ext (Trim (Copy (GMTStr, P + 1, Length (GMTStr) - P)));
		end
		else
			Result := 0;
	end;
end;

function ConvertGMTStrTimes (const FromGMTStr: string; const FromDT: TDateTime;
	const ToGMTStr: string): TDateTime;
var
	GMT1, GMT2: Extended;
begin
	GMT1 := GMTStr2Value (FromGMTStr);
	GMT2 := GMTStr2Value (ToGMTStr);
	Result := FromDT + GMT2 - GMT1;
end;

function GMTNow: TDateTime;
begin
	Result := Now + GetLocalTZBIAS * OneDTMinute;
end;

function GMTDate: TDateTime;
begin
	Result := Int (Now + GetLocalTZBIAS  * OneDTMinute);
end;

function GMTTime: TDateTime;
begin
	Result := Frac (Now + GetLocalTZBIAS * OneDTMinute);
end;

function GetRFC822Difference: string;
var
	TZ : TTimeZoneInformation;
begin
	GetTimeZoneInformation (TZ);
	if TZ.Bias <= 0 then
	begin
		TZ.Bias := Abs (TZ.Bias);
		Result := '+' + LInt2ZStr (TZ.Bias div 60, 2)
			+ LInt2ZStr (TZ.Bias mod 60, 2)
	end
	else
		Result := '-' + LInt2ZStr (TZ.Bias div 60, 2)
			+ LInt2ZStr (TZ.Bias mod 60, 2)
end;

function RFC822Value(const RFC822: string): Extended;
var
	S: String;
	L: LongInt;
begin
	S := UpperCase (Trim (RFC822));
	Result := 0.0;
	if (S = 'GMT') or (S = 'UT') or (S = 'Z') or (S = '') then
		Exit
	else if (S = 'M') then
		Result := -12.0
	else if (S = 'PST') then
		Result := -8.0
	else if (S = 'MST') or (S = 'PDT') then
		Result := -7.0
	else if (S = 'CST') or (S = 'MDT') then
		Result := -6.0
	else if (S = 'EST') or (S = 'CDT') then
		Result := -5.0
	else if (S = 'EDT') then
		Result := -4.0
	else if (S = 'A') then
		Result := -1.0
	else if (S = 'N') then
		Result := 1.0
	else if (S = 'Y') then
		Result := 12.0
	else
	begin
		L := Str2LInt (S);
		Result := L div 100 + (L mod 100) / 60;
	end;
end;

function ConvertRFC822Times (const FromRFC822: string; const FromDT: TDateTime;
	const ToRFC822: string): TDateTime;
var
	X1, X2: Extended;
begin
	X1 := RFC822Value (FromRFC822);
	X2 := RFC822Value (ToRFC822);
	Result := FromDT + (X2 - X1) * OneDTHour;
end;

function StartOfWeek (const DT: TDateTime): TDateTime;
begin
	Result := DT - DayOfWeek (DT) + 1;
end;

function EndOfWeek (const DT: TDateTime): TDateTime;
begin
	Result := DT - DayOfWeek (DT) + 7;
end;

procedure SetLocalTZBias (const Bias: Longint);
var
	TZ : TTimeZoneInformation;
begin
	case GetTimeZoneInformation (TZ) of
		TIME_ZONE_ID_STANDARD: TZ.Bias := Bias - TZ.StandardBias;
		TIME_ZONE_ID_DAYLIGHT: TZ.Bias := Bias - TZ.DaylightBias;
	else
		TZ.Bias := Bias;
	end;
	SetTimeZoneInformation (TZ);
end;

function ThisYear: Word;
begin
	Result := Date2Year (Date);
end;

function ThisMonth: Word;
begin
	Result := Date2Month (Date);
end;

function ThisDay: Word;
begin
	Result := Date2Day (Date);
end;

function ThisHr: Word;
begin
	Result := Time2Hr (Time);
end;

function ThisMin: Word;
begin
	Result := Time2Min (Time);
end;

function ThisSec: Word;
begin
	Result := Time2Sec (Time);
end;

function ThisMSec: Word;
begin
	Result := Time2MSec (Time);
end;

function SameDate (const DT1, DT2: TDateTime): Boolean;
begin
	Result := Int (DT1) = Int (DT2);
end;

function SameTime (const DT1, DT2: TDateTime): Boolean;
begin
	Result := abs (Frac (DT1) - Frac (DT2)) < OneDTMillisecond;
end;

function SameDateTime (const DT1, DT2: TDateTime): Boolean;
begin
	Result := abs (DT1 - DT2) < OneDTMillisecond;
end;

function IsJanuary (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 1;
end;

function IsJanuaryNow: Boolean;
begin
	Result := Date2Month (Date) = 1;
end;

function IsFebruary (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 2;
end;

function IsFebruaryNow: Boolean;
begin
	Result := Date2Month (Date) = 2;
end;

function IsMarch (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 3;
end;

function IsMarchNow: Boolean;
begin
	Result := Date2Month (Date) = 3;
end;

function IsApril (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 4;
end;

function IsAprilNow: Boolean;
begin
	Result := Date2Month (Date) = 4;
end;

function IsMay (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 5;
end;

function IsMayNow: Boolean;
begin
	Result := Date2Month (Date) = 5;
end;

function IsJune (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 6;
end;

function IsJuneNow: Boolean;
begin
	Result := Date2Month (Date) = 6;
end;

function IsJuly (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 7;
end;

function IsJulyNow: Boolean;
begin
	Result := Date2Month (Date) = 7;
end;

function IsAugust (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 8;
end;

function IsAugustNow: Boolean;
begin
	Result := Date2Month (Date) = 8;
end;

function IsSeptember (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 9;
end;

function IsSeptemberNow: Boolean;
begin
	Result := Date2Month (Date) = 9;
end;

function IsOctober (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 10;
end;

function IsOctoberNow: Boolean;
begin
	Result := Date2Month (Date) = 10;
end;

function IsNovember (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 11;
end;

function IsNovemberNow: Boolean;
begin
	Result := Date2Month (Date) = 11;
end;

function IsDecember (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 12;
end;

function IsDecemberNow: Boolean;
begin
	Result := Date2Month (Date) = 12;
end;

function Hrs_Min_Sec (Secs: Extended): string;
const
	 OneSecond = 1/24/3600;
var
	Total: Extended;
begin
	Total := Secs * OneSecond;
	Result := Format( '%1.0f days%s', [Int (Total),
		FormatDateTime ('hh:nn:ss', Frac (total))]);
end;

function DatesInSameMonth (const DT1, DT2: TDateTime): Boolean;
begin
	Result := Date2Month (DT1) = Date2Month (DT2);
end;

function DatesInSameYear (const DT1, DT2: TDateTime): Boolean;
begin
	Result := Date2Year (DT1) = Date2Year (DT2);
end;

function DatesInSameMonthYear (const DT1, DT2: TDateTime): Boolean;
begin
	Result := DatesInSameMonth (DT1, DT2) and DatesInSameYear (DT1, DT2);
end;

function AddDays (const DT: TDateTime; const Days: Extended): TDateTime;
begin
	Result := DT + Days;
end;

function IsAM (const DT: TDateTime): Boolean;
begin
	Result := Frac (DT) < 0.5
end;

function IsAMNow : Boolean;
begin
	Result := Frac (Time) < 0.5
end;

function IsPM (const DT: TDateTime): Boolean;
begin
	Result := not IsAM (DT);
end;

function IsPMNow: Boolean;
begin
	Result := not IsAMNow;
end;

function IsNoon (const DT: TDateTime): Boolean;
begin
	Result := Frac (DT) = 0.5;
end;

function IsNoonNow: Boolean;
begin
	Result := Frac (Time) = 0.5;
end;

function IsMidnight (const DT: TDateTime): Boolean;
begin
	Result := Frac (DT) = 0.0;
end;

function IsMidnightNow: Boolean;
begin
	Result := Frac (Time) = 0.0;
end;

function IsSunday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 1;
end;

function IsSundayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 1;
end;

function IsMonday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 2;
end;

function IsMondayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 2;
end;

function IsTuesday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 3;
end;

function IsTuesdayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 3;
end;

function IsWednesday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 4;
end;

function IsWednesdayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 4;
end;

function IsThursday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 5;
end;

function IsThursdayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 5;
end;

function IsFriday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 6;
end;

function IsFridayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 6;
end;

function IsSaturday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 7;
end;

function IsSaturdayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 7;
end;

function IsWeekend (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) in [1, 7];
end;

function IsWeekendNow: Boolean;
begin
	Result := DayOfWeek (Date) in [1, 7];
end;

function IsWeekday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) in [2..6];
end;

function IsWeekdayNow: Boolean;
begin
	Result := DayOfWeek (Date) in [2..6];
end;

function DaysApart (const DT1, DT2: TDateTime): LongInt;
begin
	Result := Trunc (DT2) - Trunc (DT1);
end;

function DateIsLeapYear (const DT: TDateTime): Boolean;
begin
	Result := IsLeapYear (Date2Year (DT));
end;

function DaysInMonth (const DT: TDateTime): Byte;
begin
	case Date2Month (DT) of
		2: if DateIsLeapYear (DT) then
			Result := 29
		   else
			Result := 28;
		4, 6, 9, 11: Result := 30;
		else
			Result := 31;
	end;
end;

function DaysInThisMonth: Byte;
begin
	Result := DaysInMonth (Date);
end;

function DaysLeftInMonth (const DT: TDateTime): Byte;
begin
	Result := DaysInMonth (DT) - Date2Day (DT);
end;

function DaysLeftInThisMonth: Byte;
begin
	Result := DaysLeftInMonth (Date);
end;

function DaysInYear (const DT: TDateTime): Word;
begin
	if DateIsLeapYear (DT) then
		Result := 366
	else
		Result := 365;
end;

function DayOfYear (const DT: TDateTime): Word;
begin
	Result := Trunc (DT) - Trunc (OptEncodeDateW (Date2Year (DT), 1, 1)) + 1;
end;

function DaysLeftInYear (const DT: TDateTime): Word;
begin
	Result := DaysInYear (DT) - DayOfYear (DT);
end;

function ThisDayOfYear: Word;
begin
	Result := DayOfYear (Date);
end;

function DaysLeftInThisYear: Word;
begin
	Result := DaysLeftInYear (Date);
end;

function WhichSemester (const DT: TDateTime): Byte;
begin
	Result := (Date2Month (DT) - 1) div 6 + 1;
end;

function WhichQuarter (const DT: TDateTime): Byte;
begin
	Result := (Date2Month (DT) - 1) div 3 + 1;
end;

function GetFirstDayofQuarter (const DT: TDateTime): TDateTime;
var
	D, M, Y: Word;
begin
	OptDecodeDateW (DT, Y, M, D);
	case M of
		1..3: M := 1;
		4..6: M := 4;
		7..9: M := 7;
		10..12: M := 10;
	end;
	Result := OptEncodeDateW (Y, M, 1) + Frac (DT);
end;

function GetLastDayofQuarter (const DT: TDateTime): TDateTime;
var
	D, M, Y: Word;
begin
	OptDecodeDateW (DT, Y, M, D);
	case M of
		1..3:
		begin
			M := 3;
			D := 31;
		end;
		4..6:
		begin
			M := 6;
			D := 30;
		end;
		7..9:
		begin
			M := 9;
			D := 30;
		end;
		10..12:
		begin
			M := 12;
			D := 31;
		end;
	end;
	Result := OptEncodeDateW (Y, M, D) + Frac (DT);
end;

function GetFirstDayofQuarter2 (const Qtr: Byte; const Year: Word): TDateTime;
begin
	Result := OptEncodeDateW (Year, (Qtr - 1) * 3 + 1, 1);
end;

function GetLastDayofQuarter2 (const Qtr: Byte; const Year: Word): TDateTime;
var
	D, M: Word;
begin
	case Qtr of
		1:
		begin
			M := 3;
			D := 31;
		end;
		2:
		begin
			M := 6;
			D := 30;
		end;
		3:
		begin
			M := 9;
			D := 30;
		end;
		4:
		begin
			M := 12;
			D := 31;
		end;
		else
		begin
			M := 0;
			D := 0;
		end;
	end;
	Result := OptEncodeDateW (Year, M, D);
end;

function GetFirstDayOfYear (const Year: Word): TDateTime;
begin
	Result := OptEncodeDateW (Year, 1, 1);
end;

function GetLastDayOfYear (const Year: Word): TDateTime;
begin
	Result := OptEncodeDateW (Year, 12, 31);
end;

function SubtractSecs (const DT: TDateTime; const Secs: Extended): TDateTime;
begin
	Result := AddSecs (DT, -1 * Secs);
end;

function SubtractMins (const DT: TDateTime; const Mins: Extended): TDateTime;
begin
	Result := AddMins (DT, -1 * Mins);
end;

function SubtractHrs (const DT: TDateTime; const Hrs: Extended): TDateTime;
begin
	Result := AddHrs (DT, -1 * Hrs);
end;

function SubtractWeeks (const DT: TDateTime; const Weeks: Extended): TDateTime;
begin
	Result := AddWeeks (DT, -1 * Weeks);
end;

function SubtractFortnights (const DT: TDateTime; const FNights: Extended): TDateTime;
begin
	Result := AddWeeks (DT, FNights * -2);
end;

function SubtractMonths (const DT: TDateTime; const Months: Extended): TDateTime;
begin
	Result := AddMonths (DT, -1 * Months);
end;

function SubtractQuarters (const DT: TDateTime; const Qtrs: Extended): TDateTime;
begin
	Result := AddMonths (DT, Qtrs * -3);
end;

function SubtractSemesters (const DT: TDateTime; const Sems: Extended): TDateTime;
begin
	Result := AddMonths (DT, Sems * -6);
end;

function SubtractYrs (const DT: TDateTime; const Yrs: Extended): TDateTime;
begin
	Result := AddYrs (DT, -1 * Yrs);
end;

function SubtractDays (const DT: TDateTime; const Days: Extended): TDateTime;
begin
	Result := DT - Days;
end;

function AgeAtDate (const DOB, DT: TDateTime): Integer;
var
	D1, M1, Y1, D2, M2, Y2: Integer;
begin
	if DT < DOB then
		Result := -1
	else
	begin
		OptDecodeDateI (DOB, Y1, M1, D1);
		OptDecodeDateI (DT, Y2, M2, D2);
		Result := Y2 - Y1;
		if (M2 < M1) or ((M2 = M1) and (D2 < D1)) then
			Dec (Result);
	end;
end;

function AgeNow (const DOB: TDateTime): Integer;
begin
	Result := AgeAtDate (DOB, Date);
end;

function Date2LongMonth (const DT: TDateTime): string;
begin
	Result := FormatSettings.LongMonthNames [Date2Month (DT)];
end;

function Date2ShortMonth (const DT: TDateTime): string;
begin
	Result := FormatSettings.ShortMonthNames [Date2Month (DT)];
end;

function Date2LongDOW (const DT: TDateTime): string;
begin
	Result := FormatSettings.LongDayNames [DayOfWeek (DT)];
end;

function Date2ShortDOW (const DT: TDateTime): string;
begin
	Result := FormatSettings.ShortDayNames [DayOfWeek (DT)];
end;

function MonthName2Month (const MonthName: string): Word;
var
	I: Integer;
     Len: Integer;
     MN: string;
begin
	Result := 0;
	if MonthName = '' then
     	Exit;
     Len := Length (MonthName);
     MN := AnsiUpperCase (MonthName);
     for I := 1 to 12 do
     begin
     	if AnsiUpperCase (LeftStr (FormatSettings.ShortMonthNames [I], Len)) = MN then
          begin
          	Result := I;
               Exit;
          end;
     end;
     for I := 1 to 12 do
     begin
     	if AnsiUpperCase (LeftStr (FormatSettings.LongMonthNames [I], Len)) = MN then
          begin
          	Result := I;
			Exit;
		end;
	end;
end;

function DayName2DOW (const DayName: string): Byte;
var
	I: Integer;
	Len: Integer;
	DN: string;
begin
	Result := 0;
	if DayName = '' then
		Exit;
	Len := Length (DayName);
	DN := AnsiUpperCase (DayName);
	for I := 1 to 7 do
	begin
		if AnsiUpperCase (LeftStr (FormatSettings.ShortDayNames [I], Len)) = DN then
		begin
			Result := I;
			Exit;
		end;
	end;
	for I := 1 to 7 do
	begin
		if AnsiUpperCase (LeftStr (FormatSettings.LongDayNames [I], Len)) = DN then
		begin
			Result := I;
			Exit;
		end;
	end;
end;

function ExactWeeksApart (const DT1, DT2: TDateTime): Extended;
begin
	Result := DaysApart (DT1, DT2) / 7;
end;

function WeeksApart (const DT1, DT2: TDateTime): Integer;
begin
	Result := DaysApart (DT1, DT2) div 7;;
end;

function CalendarWeeksApart (const DT1, DT2: TDateTime): Integer;
begin
	Result := WeeksApart (StartOfWeek (DT1), StartOfWeek (DT2));
end;

function CalendarMonthsApart (const DT1, DT2: TDateTime): Integer;
var
	D1, M1, Y1, D2, M2, Y2: Integer;
begin
	OptDecodeDateI (DT1, Y1, M1, D1);
	OptDecodeDateI (DT2, Y2, M2, D2);
	if Y1 = Y2 then
		Result := M2 - M1
	else if Y2 > Y1 then
		Result := (12 - M1) + (Y2 - (Y1 + 1)) * 12 + M2
	else
		Result := -((12 - M2) + (Y1 - (Y2 + 1)) * 12 + M1)
end;

function GetFirstSundayOfYear (const Year: Word): TDateTime;
var
	StartYear: TDateTime;
begin
	StartYear := GetFirstDayOfYear (Year);
	if DayOfWeek (StartYear) = 1 then
		Result := StartYear
	else
		Result := StartOfWeek (StartYear) + 7;
end;

function Date2WeekNo (const DT: TDateTime): Integer;
var
	Year: Word;
	FirstSunday, StartYear: TDateTime;
	WeekOfs: Byte;
begin
	Year := Date2Year (DT);
	StartYear := GetFirstDayOfYear (Year);
	if DayOfWeek (StartYear) = 0 then
	begin
		FirstSunday := StartYear;
		WeekOfs := 1;
	end
	else
	begin
		FirstSunday := StartOfWeek (StartYear) + 7;
		WeekOfs := 2;
		if DT < FirstSunday then
		begin
			Result := 1;
			Exit;
		end;
	end;
	Result := DaysApart (FirstSunday, StartofWeek (DT)) div 7 + WeekOfs;
end;

function DatesInSameWeekNo (const DT1, DT2: TDateTime): Boolean;
begin
	if Date2Year (DT1) <> Date2Year (DT2) then
		Result := False
	else
		Result := Date2WeekNo (DT1) = Date2WeekNo (DT2);
end;

function WeekNosApart (const DT1, DT2: TDateTime): Integer;
begin
	if Date2Year (DT1) <> Date2Year (DT2) then
		Result := -999
	else
		Result := Date2WeekNo (DT2) - Date2WeekNo (DT1);
end;

function ThisWeekNo: Integer;
begin
	Result := Date2WeekNo (Date);
end;

function StartOfWeekNo (const WeekNo, Year: Word): TDateTime;
var
	FirstSunday: TDateTime;
begin
	FirstSunday := GetFirstSundayOfYear (Year);
	if Date2Day (FirstSunday) = 1 then
		Result := AddWeeks (FirstSunday, WeekNo - 1)
	else
		Result := AddWeeks (FirstSunday, WeekNo - 2)
end;

function EndOfWeekNo (const WeekNo, Year: Word): TDateTime;
begin
	Result := StartOfWeekNo (WeekNo, Year) + 6;
end;

function DWY2Date (const DOW, WeekNo, Year: Word): TDateTime;
begin
	Result := StartOfWeekNo (WeekNo, Year) + DOW - 1;
end;

function AgeAtDateInMonths (const DOB, DT: TDateTime): Integer;
{ Routine donated by David Gobbett}
var
   D1, D2 : Integer;
   M1, M2 : Integer;
   Y1, Y2 : Integer;
begin
	if DT < DOB then
		Result := -1
	else
	begin
		OptDecodeDateI (DOB, Y1, M1, D1);
		OptDecodeDateI (DT, Y2, M2, D2);
		if Y1 = Y2 then // Same Year
			Result := M2 - M1
		else // Different Years
		begin
			// 12 months per year age
			Result := 12 * AgeAtDate (DOB, DT);
			if M1 > M2 then
				Result := Result + (12 - M1) + M2
			else if M1 < M2 then
				Result := Result + M2 - M1
			else	if D1 > D2 then // Same Month
				Result := Result + 12;
		end;
		if D1 > D2 then // we have counted one month too many
			Dec (Result);
	end;
end;

function AgeAtDateInWeeks (const DOB, DT: TDateTime): Integer;
{ Routine donated by David Gobbett}
begin
	if DT < DOB then
		Result := -1
	else
	begin
		Result := Trunc (DT - DOB) div 7;
	end; {else}
end;

function AgeNowInMonths (const DOB: TDateTime): Integer;
{ Routine donated by David Gobbett}
begin
	Result := AgeAtDateInMonths (DOB, Date);
end;

function AgeNowInWeeks (const DOB: TDateTime): Integer;
{ Routine donated by David Gobbett}
begin
	Result := AgeAtDateInWeeks (DOB, Date);
end;

function AgeNowDescr (const DOB: TDateTime): String;
{ Routine donated by David Gobbett}
var
	Age : integer;
begin
	Age := AgeNow (DOB);
	if Age > 0 then
	begin
		if Age = 1 then
			Result := LInt2EStr (Age) + ' year'
		else
			Result := LInt2EStr (Age) + ' years';
	end
	else
	begin
		Age := AgeNowInMonths (DOB);
		if Age >= 2 then
			Result := LInt2EStr(Age) + ' months'
		else
		begin
			Age := AgeNowInWeeks (DOB);
			if Age = 1 then
				Result := LInt2EStr(Age) + ' week'
			else
				Result := LInt2EStr(Age) + ' weeks';
		end;
	end;
end;

function ISODayOfWeek (const DT: TDateTime): Integer;
begin
	Result := DayOfWeek (DT);
	Dec (Result);
	if Result = 0 then
		Result := 7;
end;

function StartOfISOWeek (const DT: TDateTime): TDateTime;
begin
	Result := DT - ISODayOfWeek (DT) + 1;
end;

function EndOfISOWeek (const DT: TDateTime): TDateTime;
begin
	Result := DT - ISODayOfWeek (DT) + 7;
end;

{: Most years have 52 weeks, but years that start on a Thursday and leap
years that start on a Wednesday (or Thursday) have 53 weeks. Based on
code supplied by Niklas Astram }
function ISOWeeksInYear (const Year: Word): Byte;
var
	DOW: Integer;
begin
	DOW := ISODayOfWeek (GetFirstDayOfYear (Year));
	if (DOW = 4) or ((DOW = 3) and IsLeapYear (Year)) then
		Result := 53
	else
		Result :=52;
end;

procedure Date2ISOWeekNo (const DT: TDateTime; var WeekNo: Byte;
	var Year: Word);
var
	FirstMonday, StartYear: TDateTime;
	WeekOfs: Byte;
begin
	Year := Date2Year (DT);
	StartYear := GetFirstDayOfYear (Year) + 3; // Jan 4th
	if ISODayOfWeek (StartYear) <= 4 then
	begin
		FirstMonday := StartOfISOWeek (StartYear);
		WeekOfs := 1;
		if DT < FirstMonday then
		begin
			Dec (Year);
			WeekNo := ISOWeeksInYear (Year);
			Exit;
		end;
	end
	else
	begin
		FirstMonday := StartOfISOWeek (StartYear) + 7;
		WeekOfs := 2;
		if DT < FirstMonday then
		begin
			WeekNo := 1;
			Exit;
		end;
	end;
	WeekNo := DaysApart (FirstMonday, StartofISOWeek (DT)) div 7 + WeekOfs;
	if WeekNo > ISOWeeksInYear (Year) then
	begin
		WeekNo := 1;
		Inc (Year);
	end;
end;

function Date2ISOWeekStr (const DT: TDateTime): string;
var
	WeekNo: Byte;
	Year: Word;
begin
	Date2ISOWeekNo (DT, WeekNo, Year);
	Result := LInt2ZStr (Year, 4) + 'W' + LInt2ZStr (WeekNo, 2)
		+ LInt2EStr (ISODayOfWeek (DT));
end;

function Date2ISOWeekEnhStr (const DT: TDateTime): string;
var
	WeekNo: Byte;
	Year: Word;
begin
	Date2ISOWeekNo (DT, WeekNo, Year);
	Result := LInt2ZStr (Year, 4) + '-W' + LInt2ZStr (WeekNo, 2) + '-'
		+ LInt2EStr (ISODayOfWeek (DT));
end;

function Date2ISOWeekOnlyStr (const DT: TDateTime): string;
var
	WeekNo: Byte;
	Year: Word;
begin
	Date2ISOWeekNo (DT, WeekNo, Year);
	Result := LInt2ZStr (Year, 4) + 'W' + LInt2ZStr (WeekNo, 2);
end;

function Date2ISOWeekOnlyEnhStr (const DT: TDateTime): string;
var
	WeekNo: Byte;
	Year: Word;
begin
	Date2ISOWeekNo (DT, WeekNo, Year);
	Result := LInt2ZStr (Year, 4) + '-W' + LInt2ZStr (WeekNo, 2);
end;

function Date2ISOStr (const DT: TDateTime): string;
var
	D, M, Y: Integer;
begin
	OptDecodeDateI (DT, Y, M, D);
	Result := LInt2ZStr (Y, 4) + LInt2ZStr (M, 2)
		+ LInt2ZStr (D, 2);
end;

function Date2ISOInt (const DT: TDateTime): Cardinal;
var
	D, M, Y: Integer;
begin
	OptDecodeDateI (DT, Y, M, D);
	Result := Y * 10000 + M * 100 + D;
end;

function Date2ISOEnhStr (const DT: TDateTime): string;
var
	D, M, Y: Integer;
begin
	OptDecodeDateI (DT, Y, M, D);
	Result := LInt2ZStr (Y, 4) + '-' + LInt2ZStr (M, 2) + '-'
		+ LInt2ZStr (D, 2);
end;

function DatesInSameISOWeekNo (const DT1, DT2: TDateTime): Boolean;
var
	W1, W2: Byte;
	Y1, Y2: Word;
begin
	Date2ISOWeekNo (DT1, W1, Y1);
	Date2ISOWeekNo (DT2, W2, Y2);
	Result := (W1 = W2) and (Y1 = Y2);
end;

function ISOWeekNosApart (DT1, DT2: TDateTime): Integer;
var
	W1, W2: Byte;
	I, Y1, Y2: Word;
	Negative: Boolean;
	DTHold: TDateTime;
begin
	Negative := Int (DT2) < Int (DT1);
	if Negative then
	begin
		DTHold := DT1;
		DT1 := DT2;
		DT2 := DTHold;
	end;

	// Now DT1 <= DT2

	Date2ISOWeekNo (DT1, W1, Y1);
	Date2ISOWeekNo (DT2, W2, Y2);
	if Y1 = Y2 then
		Result := W2 - W1
	else
	begin
		Result := ISOWeeksInYear (Y1) - W1 + W2;
		for I := Y1 + 1 to Y2 - 1 do
			Result := Result + ISOWeeksInYear (I)
	end;

	if Negative then
		Result := -1 * Result;
end;

procedure ThisISOWeekNo (var WeekNo: Byte; var Year: Word);
begin
	Date2ISOWeekNo (Date, WeekNo, Year);
end;

function GetFirstMondayOfYear (const Year: Word): TDateTime;
var
	StartYear: TDateTime;
begin
	StartYear := GetFirstDayOfYear (Year);
	if ISODayOfWeek (StartYear) = 1 then
		Result := StartYear
	else
		Result := StartOfISOWeek (StartYear) + 7;
end;

function StartOfISOWeekNo (const WeekNo, Year: Word): TDateTime;
var
	FirstMonday: TDateTime;
begin
	FirstMonday := GetFirstMondayOfYear (Year);
	if Date2Day (FirstMonday) < 5 then
		Result := AddWeeks (FirstMonday, WeekNo - 1)
	else
		Result := AddWeeks (FirstMonday, WeekNo - 2)
end;

function EndOfISOWeekNo (const WeekNo, Year: Word): TDateTime;
begin
	Result := StartOfISOWeekNo (WeekNo, Year) + 6;
end;

function ISOYWD2Date (const Year: Word; const WeekNo, DOW: Byte): TDateTime;
begin
	Result := StartOfISOWeekNo (WeekNo, Year) + DOW - 1;
end;

function ElapsingTime (DT1, DT2: TDateTime ): string;

	function GetPadChar (ReturnChar: Boolean): string;
	begin
		if ReturnChar then
			Result := ' '
		else
			Result := '';
	end;

	function SetDTString (Value: LongInt; const OneStr, TwoStr: string): string;
	begin
		Result := '';
		if Value = 1 then
			Result := Format ('%d ' + OneStr, [1])
		else if Value > 1 then
			Result := Format( '%d ' + TwoStr, [Value] );
	end;

const
	OneWeek = 'week';
	FewWeeks = 'weeks';
	OneDay = 'day';
	FewDays = 'days';
	OneHour = 'hr';
	FewHours = 'hrs';
	OneMin = 'min';
	FewMins = 'mins';
	OneSec = 'sec';
	FewSecs = 'secs';
	OneMSec = 'msec';
	FewMSecs = 'msecs';

var
	Week, Day: LongInt;
	Hour, Min, Sec, MSec: Word;
	DTHold: TDateTime;
	PadChar: string;
begin
	if DT2 < DT1 then
	begin
		DTHold := DT1;
		DT1 := DT2;
		DT2 := DTHold;
	end;

	Week := Trunc (ExactWeeksApart (DT1, DT2));
	Day := DaysApart (DT1, DT2) - (Week * 7);
	DecodeTime (DT2 - DT1, Hour, Min, Sec, MSec);

	// Week
	Result := SetDTString (Week, OneWeek, FewWeeks);

	// Day
	PadChar := GetPadChar (Result <> '');
	Result := Result + PadChar + SetDTString (Day, OneDay, FewDays);

	// Hour
	PadChar := GetPadChar (Result <> '');
	Result := Result + PadChar + SetDTString (Hour, OneHour, FewHours);

	// Min
	PadChar := GetPadChar (Result <> '');
	Result := Result + PadChar + SetDTString (Min, OneMin, FewMins);

	// Sec
	PadChar := GetPadChar (Result <> '');
	Result := Result + PadChar + SetDTString (Sec, OneSec, FewSecs);

	// MSec
	PadChar := GetPadChar (Result <> '');
	Result := Result + PadChar + SetDTString (MSec, OneMSec, FewMSecs);
end;

{$IFDEF D4PLUS}
function DateTimeToLargeInteger (const DT: TDateTime): Large_Integer;
const
	LclTab: array [1..12] of Byte = (30,28,31,30,31,30,31,31,30,31,30,31);
var
	LclInt: Word;
	LclTDateTime: TDateTime;
	LclSystemTime: TSystemTime;
begin
	Result.QuadPart := 0;
	if DT < 1 then
	   LclTDateTime := SysUtils.Date
	else
	   LclTDateTime := 0;

	LclTDateTime := GetGMTTime (LclTDateTime + DT);
	DateTimeToSystemTime (LclTDateTime, LclSystemTime);

	with LclSystemTime do
	begin
		for LclInt := 1601 to wYear - 1 do
		    Inc (Result.QuadPart, 365 + Integer (IsLeapYear(LclInt)));

		for LclInt:= 1 to wMonth - 1 do
		    Inc (Result.QuadPart, LclTab [lclInt]);

		if (wMonth > 2) and IsLeapYear(WYear) then
		   Inc(Result.QuadPart);

		Inc (Result.QuadPart, wDay);

		Result.QuadPart := (Result.QuadPart * 86400 +  // 24*60*60
			(wHour * 60 + wMinute) * 60 + wSecond) * 10000000;
	end
end;

{--- FileTime Routines ---}

function FileTime2DateTime (const FT: TFileTime): TDateTime;
var
	ST: TSystemTime;
begin
  	FileTimeToSystemTime (FT, ST);
  	Result := SystemTimeToDateTime (ST);
end;

function DateTime2FileTime (const DT: TDateTime): TFileTime;
var
	ST: TSystemTime;
begin
	if DT <= -109205.0 then // Check to see if Date/Time before 1/1/1601
		Int64 (Result) := 0
     else
     begin
		DateTimeToSystemTime (DT, ST);
          SystemTimeToFileTime (ST, Result);
     end;
end;
{$ENDIF}

function IsValidShortMonth (const Month: string): Boolean;
var
	I: Integer;
begin
	Result := False;
	for I := 1 to 12 do
		if AnsiCompareText (Month, FormatSettings.ShortMonthNames [I]) = 0 then
		begin
			Result := True;
			Break
		end;
end;

function IsValidLongMonth (const Month: string): Boolean;
var
	I: Integer;
begin
	Result := False;
	for I := 1 to 12 do
		if AnsiCompareText (Month, FormatSettings.LongMonthNames [I]) = 0 then
		begin
			Result := True;
			Break
		end;
end;

function IsValidShortDOW (const DOW: string): Boolean;
var
	I: Integer;
begin
	Result := False;
	for I := 1 to 12 do
		if AnsiCompareText (DOW, FormatSettings.ShortDayNames [I]) = 0 then
		begin
			Result := True;
			Break
		end;
end;

function IsValidLongDOW (const DOW: string): Boolean;
var
	I: Integer;
begin
	Result := False;
	for I := 1 to 12 do
		if AnsiCompareText (DOW, FormatSettings.LongDayNames [I]) = 0 then
		begin
			Result := True;
			Break
		end;
end;

function IsFirstDayOfMonth (const DT: TDateTime): Boolean;
begin
	Result := Date2Day (DT) = 1;
end;

function IsFirstDayOfMonthNow: Boolean;
begin
	Result := IsFirstDayOfMonth (SysUtils.Date);
end;

function IsLastDayOfMonth (const DT: TDateTime): Boolean;
begin
	Result := Int (DT) = Int (GetLastDayOfMonth (DT));
end;

function IsLastDayOfMonthNow: Boolean;
begin
	Result := IsLastDayOfMonth (SysUtils.Date);
end;

function IsFirstDayOfYear (const DT: TDateTime): Boolean;
begin
	Result := Int (DT) = Int (GetFirstDayOfYear (Date2Year (DT)));
end;

function IsFirstDayOfYearNow: Boolean;
begin
	Result := IsFirstDayOfYear (SysUtils.Date);
end;

function IsLastDayOfYear (const DT: TDateTime): Boolean;
begin
	Result := Int (DT) = Int (GetLastDayOfYear (Date2Year (DT)));
end;

function IsLastDayOfYearNow: Boolean;
begin
	Result := IsLastDayOfYear (SysUtils.Date);
end;

function ISODateTime2DateTime (const ISODT: String): TDateTime;
var
	sDate, sTime: string;
	Year, Month, Day: Word;
	P: Integer;
begin
	try
		P := Pos (' ', ISODT);
		sDate := Trim (LeftStr (ISODT, P - 1));
		sTime := Trim (RightAfterStr (ISODT, P));
		sTime := ReplaceChStr (sTime, ':', FormatSettings.TimeSeparator); //Change to Locale Settings

		P := Pos ('-', sDate);
		Year :=  Str2Lint (LeftStr (sDate, P - 1));
		sDate := RightAfterStr (sDate, P);

		P := Pos ('-', sDate);
		Month :=  Str2Lint (LeftStr (sDate, P - 1));
		Day := Str2Lint (RightAfterStr (sDate, P));
		Result := OptEncodeDateW (Year, Month, Day) + Frac (Str2Time (sTime));
	except
		result := 0;
	end;
end;

function OptDate: TDateTime;
var
	ST: TSystemTime;
begin
	Windows.GetLocalTime (ST);
	Result := OptEncodeDateW (ST.wYear, ST.wMonth, ST.wDay);
end;

procedure OptDecodeDateI (const DT: TDateTime; out Year, Month, Day: Integer);
var
	J: Integer;
begin
	J := pred ((Trunc (DT) + 693900) shl 2);
	Year := J div 146097;
	Day := (J - 146097 * Year) shr 2;
	J := (Day shl 2 + 3) div 1461;
	Day:= (Day shl 2 + 7 - 1461 * J) shr 2;
	Month :=(5 * Day - 3) div 153;
	Day := (5 * Day + 2 - 153 * Month) div 5;
	Year := 100 * Year + J;
	if Month < 10 then
		Inc (Month, 3)
	else
	begin
		Dec (Month, 9);
		Inc (Year);
	end;
end;

procedure OptDecodeDateW (const DT: TDateTime; out Year, Month, Day: Word);
var
	J: Integer;
begin
	J := pred ((Trunc (DT) + 693900) shl 2);
	Year := J div 146097;
	Day := (J - 146097 * Year) shr 2;
	J := (Day shl 2 + 3) div 1461;
	Day:= (Day shl 2 + 7 - 1461 * J) shr 2;
	Month :=(5 * Day - 3) div 153;
	Day := (5 * Day + 2 - 153 * Month) div 5;
	Year := 100 * Year + J;
	if Month < 10 then
		Inc (Month, 3)
	else
	begin
		Dec (Month, 9);
		Inc (Year);
	end;
end;

function OptEncodeDateI (Year, Month, Day: Integer): TDateTime;
var
	DayTable : PDayTable;
begin
	DayTable := @MonthDays [IsLeapYear (Year)];
	if (Day <= DayTable^[Month]) and (Year > 0) and (Year < 10000) and
		(Month < 13) and (Day > 0) then
	begin
		if Month > 2 then
			Dec (Month,3)
		else if (Month > 0) then
		begin
			Inc (Month, 9);
			Dec(Year);
		end
		else // Month <= 0
			raise Exception.Create (rsInvalidDate);

		Result := (146097 * (Year div 100)) shr 2 +
			(1461 * (Year - 100*(Year div 100))) shr 2 +
			 (153 * Month+2) div 5 + Day - 693900;
	end
	else
		raise Exception.Create (rsInvalidDate + IntToStr (Year) + '-'
			+ IntToStr (Month) + '-' + IntToStr (Day));
end;

function OptEncodeDateW (Year, Month, Day: Word): TDateTime;
var
	DayTable : PDayTable;
begin
	DayTable := @MonthDays [IsLeapYear (Year)];
	if (Day <= DayTable^[Month]) and (Year > 0) and (Year < 10000) and
		(Month < 13) and (Day > 0) then
	begin
		if Month > 2 then
			Dec (Month,3)
		else if (Month > 0) then
		begin
			Inc (Month, 9);
			Dec(Year);
		end
		else // Month <= 0
			raise Exception.Create (rsInvalidDate);

		Result := (146097 * (Year div 100)) shr 2 +
			(1461 * (Year - 100*(Year div 100))) shr 2 +
			 (153 * Month+2) div 5 + Day - 693900;
	end
	else
		raise Exception.Create (rsInvalidDate);
end;

function OptDate2Year (const DT: TDateTime) : Word;
var
	J: Integer;
	Day, Month, Year: Integer;
begin
	J := pred ((Trunc (DT) + 693900) shl 2);
	Year := J div 146097;
	Day := (J - 146097 * Year) shr 2;
	J := (Day shl 2 + 3) div 1461;
	Day:= (Day shl 2 + 7 - 1461 * J) shr 2;
	Month :=(5 * Day - 3) div 153;
	Year := 100 * Year + J;
	if Month >= 10 then
		Inc (Year);
	Result := Year
end;

function OptDate2Month (const DT: TDateTime) : Word;
var
	J: Integer;
	Day, Month, Year: Integer;
begin
	J := pred ((Trunc (DT) + 693900) shl 2);
	Year := J div 146097;
	Day := (J - 146097 * Year) shr 2;
	J := (Day shl 2 + 3) div 1461;
	Day:= (Day shl 2 + 7 - 1461 * J) shr 2;
	Month :=(5 * Day - 3) div 153;
	if Month < 10 then
		Inc (Month, 3)
	else
		Dec (Month, 9);
	Result := Month
end;

function OptDate2Day (const DT: TDateTime) : Word;
var
	J: Integer;
	Day, Month, Year: Integer;
begin
	J := pred ((Trunc (DT) + 693900) shl 2);
	Year := J div 146097;
	Day := (J - 146097 * Year) shr 2;
	J := (Day shl 2 + 3) div 1461;
	Day:= (Day shl 2 + 7 - 1461 * J) shr 2;
	Month :=(5 * Day - 3) div 153;
	Day := (5 * Day + 2 - 153 * Month) div 5;
	Result := Day
end;

function OptThisYear: Integer;
var
	ST: TSystemTime;
begin
	Windows.GetLocalTime (ST);
	Result := ST.wYear;
end;

function OptThisMonth: Integer;
var
	ST: TSystemTime;
begin
	Windows.GetLocalTime (ST);
	Result := ST.wMonth;
end;

function OptThisDay: Integer;
var
	ST: TSystemTime;
begin
	Windows.GetLocalTime (ST);
	Result := ST.wDay;
end;

function OptDayOfYear (const DT: TDateTime): Integer;
begin
	Result := Trunc (DT) - Trunc (OptEncodeDateI (OptDate2Year (DT), 1, 1)) + 1;
end;

function OptDaysLeftInYear (const DT: TDateTime): Integer;
begin
	Result := DaysInYear (DT) - OptDayOfYear (DT);
end;

function OptThisDayOfYear: Integer;
begin
	Result := OptDayOfYear (OptDate);
end;

function OptDaysLeftInThisYear: Integer;
begin
	Result := OptDaysLeftInYear (OptDate);
end;

function Date2AccessStr (const DT: TDateTime): String;
var
	Day, Month, Year: Integer;
begin
	try
		OptDecodeDateI (DT, Year, Month, Day);
		Result := '#' + LInt2ZStr (Month, 2) + '/' + LInt2ZStr (Day, 2)
			+ '/' + LInt2ZStr (Year, 4) + '#';
	except
		Result := '';
	end;
end;

function Date2ANSISQLStr (const DT: TDateTime): String;
var
	Day, Month, Year: Integer;
begin
	try
		OptDecodeDateI (DT, Year, Month, Day);
		Result := '{ d ''' + LInt2ZStr (Year, 4) + '-' + LInt2ZStr (Month, 2)
			+ '-' + LInt2ZStr (Day, 2) + ''' }';
	except
		Result := '';
	end;
end;

function Days2Hrs (const Value: Extended): Extended;
begin
	Result := Value * HrsPerDay;
end;

function Hrs2Days (const Value: Extended): Extended;
begin
	Result := Value * DaysPerHr;
end;

function Mins2Hrs (const Value: Extended): Extended;
begin
	Result := Value * HrsPerMin;
end;

function Hrs2Mins (const Value: Extended): Extended;
begin
	Result := Value * MinsPerHr;
end;

function Mins2Secs (const Value: Extended): Extended;
begin
	Result := Value * SecsPerMin;
end;

function Secs2Mins (const Value: Extended): Extended;
begin
	Result := Value * MinsPerSec;
end;

function Hrs2Secs (const Value: Extended): Extended;
begin
	Result := Value * SecsPerHr;
end;

function Secs2Hrs (const Value: Extended): Extended;
begin
	Result := Value * HrsPerSec;
end;

function Days2Secs (const Value: Extended): Extended;
begin
	Result := Value * SecsPerDay;
end;

function Secs2Days (const Value: Extended): Extended;
begin
	Result := Value * DaysPerSec;
end;

function Days2Mins (const Value: Extended): Extended;
begin
	Result := Value * MinsPerDay;
end;

function Mins2Days (const Value: Extended): Extended;
begin
	Result := Value * DaysPerMin;
end;

function Days2Weeks (const Value: Extended): Extended;
begin
	Result := Value * WeeksPerDay;
end;

function Weeks2Days (const Value: Extended): Extended;
begin
	Result := Value * DaysPerWeek;
end;

function Days2Fortnights (const Value: Extended): Extended;
begin
	Result := Value * FortnightsPerDay;
end;

function Fortnights2Days (const Value: Extended): Extended;
begin
	Result := Value * DaysPerFortnight;
end;

function Days2Months (const Value: Extended): Extended;
begin
	Result := Value / DaysPerSynodicMonth;
end;

function Months2Days (const Value: Extended): Extended;
begin
	Result := Value * DaysPerSynodicMonth;
end;

function Days2Years (const Value: Extended): Extended;
begin
	Result := Value / DaysPerTropicalYear;
end;

function Years2Days (const Value: Extended): Extended;
begin
	Result := Value * DaysPerTropicalYear;
end;

function Days2YearsGregorian (const Value: Extended): Extended;
begin
	Result := Value / DaysPerGregorianYear;
end;

function YearsGregorian2Days (const Value: Extended): Extended;
begin
	Result := Value * DaysPerGregorianYear;
end;

function Days2YearsJulian (const Value: Extended): Extended;
begin
	Result := Value / DaysPerJulianYear;
end;

function YearsJulian2Days (const Value: Extended): Extended;
begin
	Result := Value * DaysPerJulianYear;
end;

function Sec2TimeStr (Sec : LongInt): string;
var
	Tmp: LongInt ;
begin
	Tmp := Sec;
	Result:= LInt2EStr (tmp div 3600) + FormatSettings.TimeSeparator;
	Tmp := Tmp mod 3600;
	Result := Result + LInt2ZStr (Tmp div 60, 2) + FormatSettings.TimeSeparator;
	Tmp := Tmp mod 60;
	Result := Result + LInt2ZStr(Tmp, 2);
end;

function EnhStr2Date (InDate: String): TDateTime;
var
	Year, Month, Day: Integer;
	DateOrder: TDateOrder;
	cnt: Integer;

	procedure ConvertMonth (const MMM: string; MM : ShortInt);
	var
		Posn: integer;
	begin
		Posn := Pos (MMM, InDate);
		if Posn > 0 then
		begin
			Delete (InDate, Posn, Length (MMM));
			Insert (Format ('%.2d', [MM]), InDate, Posn);

			if (Length (InDate) > Posn + 2) and
				(Copy (InDate, Posn + 2, 1) <> FormatSettings.DateSeparator) then
			begin
				Insert (FormatSettings.DateSeparator, InDate, Posn + 2);
			end;

			if Posn = 1 then
			begin
				// If the Month was found at the start, we know the order is MDY
				DateOrder := doMDY;
			end
			else
			begin
				// Put in DateSeparator characters if they don't exist
				if Copy (InDate, Posn - 1, 1) <> FormatSettings.DateSeparator then
					Insert (FormatSettings.DateSeparator, InDate, Posn);
			end;
			Month := MM;
		end;
	end;

	function GetNextNumber (Len: ShortInt) : Integer;
	var
		cnt : ShortInt;
	begin
		Result := 0;

		// If their is a date separator found, load the entire number
		cnt := Pos (FormatSettings.DateSeparator, InDate);
		if (cnt <> 0) and (cnt <= 5) then
			Len := cnt;

		while Len > 0 do
		begin
			if Length(InDate) = 0 then
				Break;

			if Copy (InDate, 1, 1) = FormatSettings.DateSeparator then
				Break;

			Result := Result * 10 + Ord (InDate [1]) - 48;
			Dec (Len);
			Delete (InDate, 1, 1);
		end;

		// Remove any Date Separator characters
		while Copy (InDate, 1, 1) = FormatSettings.DateSeparator do
			Delete (InDate, 1, 1);
	end;

begin
	Year := 0;
	Month := 0;
	Day := 0;
	DateOrder := doUnknown;

	try
		// Trim any leading / trailing spaces from the input
		InDate := UpperCase (Trim (InDate));

		// Allow ' ', '-' and '/' as valid alternatives for DateSeparator
		InDate := ReplaceChStr (InDate, ' ', FormatSettings.DateSeparator);
		InDate := ReplaceChStr (InDate, '-', FormatSettings.DateSeparator);
		InDate := ReplaceChStr (InDate, '/', FormatSettings.DateSeparator);
		InDate := ReplaceChStr (InDate, '\', FormatSettings.DateSeparator);

		// Remove any leading / trailing seperators
		while Copy (InDate, 1, 1) = FormatSettings.DateSeparator do
			Delete (InDate, 1, 1);
		while Copy (InDate, Length(InDate), 1) = FormatSettings.DateSeparator do
			Delete (InDate, Length(InDate), 1);

		if InDate = '' then
		begin
			Result := 0.0;
			Exit;
		end;

		// Firstly, See if we have the month in words
		for cnt := 1 to 12 do
			ConvertMonth (UpperCase (FormatSettings.ShortMonthNames [cnt]), cnt);

		// Remove any characters from the remainder, leaving only numbers and DateSeparator
		cnt := 1;
		while (cnt <= Length (InDate)) do
		begin
			if (InDate [cnt] in ['0'..'9', FormatSettings.DateSeparator]) then
				Inc (cnt)
			else
				Delete (InDate, cnt, 1);
		end;

		if DateOrder = doUnknown then
			DateOrder := GetDateOrder (FormatSettings.ShortDateFormat);

		// OK, we've interrogated the date as much as possible, time to convert it
		case DateOrder of
			doDMY :
			begin
				Day := GetNextNumber (2);
				Month := GetNextNumber (2);
				Year := GetNextNumber (4);
			end;
			doMDY :
			begin
				Month := GetNextNumber (2);
				Day := GetNextNumber (2);
				Year := GetNextNumber (4);
			end;
			doYMD :
			begin
				if Length (InDate) > 8 then
					Year := GetNextNumber (4)
				else
					Year  := GetNextNumber (2);
				Month := GetNextNumber (2);
				Day   := GetNextNumber (2);
			end;
		end;

		if Month = 0 then
			Month := OptThisMonth;
		if Year  = 0 then
			Year  := OptThisYear;

		// Just in case the date has been entered in a different order to what
		// was expected, try and switch the numbers around
		if (Day > 1000) and (Year <= 31) then
		begin
			cnt   := Year;
			Year  := Day;
			Day   := cnt;
		end;
		if (Month > 1000) and (Year <= 12) then
		begin
			cnt   := Year;
			Year  := Month;
			Month := cnt;
		end;
		if Year < 100 then // If 2 Digit
		begin
			case ESB2DigitYr of
				// edyNone - Nothing has to be done
				edyCutOff: // Process using ESB2DigitCutOff
				begin
					if 1900 + Year < ESB2DigitCutOff then
						Year := 2000 + Year
					else
						Year := 1900 + Year
				end;
				edyHistoric: // Take Yr as this year or earlier
				begin
					if 2000 + Year <= ThisYear then
						Year := 2000 + Year
					else
						Year := 1900 + Year;
				end;
			end;
		end;

		// Assume ALL dates entered fall between these two numbers
		if (Year < 1900) or (Year > 2100) then
		begin
			cnt := Day * 100 + Month;
			if (cnt >= 1900) and (cnt <= 2100) then
			begin
				cnt   := Year;
				Year  := Day * 100 + Month;
				Month := cnt div 100;
				Day   := cnt mod 100;
			end;
		end;

		Result := OptEncodeDateI (Year, Month, Day);

	except
    // The date entered must have been invalid
		Result := 0.0;
	end;
end;

end.

