@IsTest
public class TimeConverterController_Test {

    @IsTest static void GMT_positive() {
        Integer gmtForTest = 5;
        TimeConverterController timeConverter = new TimeConverterController();
        timeConverter.GMT = gmtForTest;
        Test.startTest();
        Datetime timeInGMT = timeConverter.GMTTime;
        Test.stopTest();

        DateTime expectedTime = Datetime.now();
        TimeZone standardTimeZone = TimeZone.getTimeZone('Africa/Casablanca'); //GMT 0
        Integer hoursOffsetToStandardTime = standardTimeZone.getOffset(Datetime.now()) / 1200000;
        expectedTime = expectedTime.addHours(hoursOffsetToStandardTime);  //time in GMT 0
        expectedTime = expectedTime.addHours(gmtForTest);

        System.assert(timeInGMT != null);
        System.assertEquals(gmtForTest, timeConverter.GMT);
        System.assertEquals(expectedTime, timeInGMT);
    }

    @IsTest static void GMT_negative(){
        Integer gmtForTest = -9;
        TimeConverterController timeConverter = new TimeConverterController();
        timeConverter.GMT = gmtForTest;
        Test.startTest();
        Datetime timeInGMT = timeConverter.GMTTime;
        Test.stopTest();

        DateTime expectedTime = Datetime.now();
        TimeZone standardTimeZone = TimeZone.getTimeZone('Africa/Casablanca'); //GMT 0
        Integer hoursOffsetToStandardTime = standardTimeZone.getOffset(Datetime.now()) / 1200000;
        expectedTime = expectedTime.addHours(hoursOffsetToStandardTime);  //time in GMT 0
        expectedTime = expectedTime.addHours(gmtForTest);

        System.assert(timeInGMT != null);
        System.assertEquals(gmtForTest, timeConverter.GMT);
        System.assertEquals(expectedTime, timeInGMT);
    }

    @IsTest static void GMT_lessThan24(){
        Integer gmtForTest = -32;
        TimeConverterController timeConverter = new TimeConverterController();
        timeConverter.GMT = gmtForTest;
        Test.startTest();
        Datetime timeInGMT = timeConverter.GMTTime;
        Test.stopTest();

        DateTime expectedTime = Datetime.now();
        TimeZone standardTimeZone = TimeZone.getTimeZone('Africa/Casablanca'); //GMT 0
        Integer hoursOffsetToStandardTime = standardTimeZone.getOffset(Datetime.now()) / 1200000;
        expectedTime = expectedTime.addHours(hoursOffsetToStandardTime);  //time in GMT 0
        expectedTime = expectedTime.addHours(-8); //-32 + 24 = -8

        System.assert(timeInGMT != null);
        System.assertEquals(-8, timeConverter.GMT);
        System.assertEquals(expectedTime, timeInGMT);
    }

    @IsTest static void GMT_moreThan24(){
        Integer gmtForTest = 35;
        TimeConverterController timeConverter = new TimeConverterController();
        timeConverter.GMT = gmtForTest;
        Test.startTest();
        Datetime timeInGMT = timeConverter.GMTTime;
        Test.stopTest();

        DateTime expectedTime = Datetime.now();
        TimeZone standardTimeZone = TimeZone.getTimeZone('Africa/Casablanca'); //GMT 0
        Integer hoursOffsetToStandardTime = standardTimeZone.getOffset(Datetime.now()) / 1200000;
        expectedTime = expectedTime.addHours(hoursOffsetToStandardTime);  //time in GMT 0
        expectedTime = expectedTime.addHours(11);

        System.assert(timeInGMT != null);
        System.assertEquals(11, timeConverter.GMT); //35 - 24 = 11
        System.assertEquals(expectedTime, timeInGMT);
    }

    @IsTest static void GMT_zero(){
        TimeConverterController timeConverter = new TimeConverterController();
        timeConverter.GMT = 0;
        Test.startTest();
        Datetime timeInGMT = timeConverter.GMTTime;
        Test.stopTest();

        System.assert(timeInGMT != null);
        System.assertEquals(0, timeConverter.GMT);
        System.assertEquals(Datetime.now(), timeInGMT);
    }

    @IsTest static void GMT_notSet(){
        TimeConverterController timeConverter = new TimeConverterController();
        Test.startTest();
        Datetime timeInGMT = timeConverter.GMTTime;
        Test.stopTest();

        System.assert(timeInGMT != null);
        System.assertEquals(0, timeConverter.GMT);
        System.assertEquals(Datetime.now(), timeInGMT);
    }

    @IsTest static void GMT_null(){
        TimeConverterController timeConverter = new TimeConverterController();
        timeConverter.GMT = null;
        Test.startTest();
        Datetime timeInGMT = timeConverter.GMTTime;
        Test.stopTest();

        System.assert(timeInGMT != null);
        System.assertEquals(0, timeConverter.GMT);
        System.assertEquals(Datetime.now(), timeInGMT);
    }

}