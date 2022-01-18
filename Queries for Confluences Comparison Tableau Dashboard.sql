







--USE THESE QUERIES FOR A COMPARISON OF CONFLUENCES DASHBOARD IN TABLEAU

-----------------------------------------------------------------------

--Bearish Hammer

--NUMBER OF BEARISH & BULLISH HAMMER CONFLUENCES

SELECT Confluence, COUNT(Confluence) Hammer,SUM(ProfitLossFTP) TotalHammerProfit
FROM AUDJPY
WHERE Confluence = 'Bearish Hammer'
GROUP BY Confluence
ORDER BY Hammer DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BEARISH & BULLISH HAMMER OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(ProfitLossFTP) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bearish Hammer'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BEARISH & BULLISH HAMMER OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(ProfitLossTSL) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bearish Hammer'
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;


SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearHamTSL
) Total
WHERE Confluence = 'Bearish Hammer'

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearHamTSL
) Total
WHERE Confluence = 'Bearish Hammer'
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearHamTSL
) Total
WHERE Confluence = 'Bearish Hammer'
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearHamTSL
) Total
WHERE Confluence = 'Bearish Hammer'
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearHamTSL
) Total
WHERE Confluence = 'Bearish Hammer'
GROUP BY Confluence;

-----------------------------------------------------------------------

--Bullish Hammer

--NUMBER OF BEARISH & BULLISH HAMMER CONFLUENCES

SELECT Confluence, COUNT(Confluence) Hammer,SUM(ProfitLossFTP) TotalHammerProfit
FROM AUDJPY
WHERE Confluence = 'Bullish Hammer'
GROUP BY Confluence
ORDER BY Hammer DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BEARISH & BULLISH HAMMER OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(ProfitLossFTP) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bullish Hammer'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BEARISH & BULLISH HAMMER OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(ProfitLossTSL) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bullish Hammer'
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullHamTSL
) Total
WHERE Confluence = 'Bullish Hammer'

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullHamTSL
) Total
WHERE Confluence = 'Bullish Hammer'
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullHamTSL
) Total
WHERE Confluence = 'Bullish Hammer'
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullHamTSL
) Total
WHERE Confluence = 'Bullish Hammer'
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullHamTSL
) Total
WHERE Confluence = 'Bullish Hammer'
GROUP BY Confluence;

-----------------------------------------------------------------------

--B&R

--NUMBER OF B&R CONFLUENCES

SELECT Confluence, COUNT(Confluence) BnR
FROM AUDJPY
WHERE Confluence = 'B&R' 
GROUP BY Confluence
ORDER BY BnR DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRTSL
) Total
WHERE Confluence = 'B&R'
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRTSL
) Total
WHERE Confluence = 'B&R'
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRTSL
) Total
WHERE Confluence = 'B&R'
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRTSL
) Total
WHERE Confluence = 'B&R'
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRTSL
) Total
WHERE Confluence = 'B&R'
GROUP BY Confluence;

-----------------------------------------------------------------------

--BEARISH ENGULFING 

--NUMBER OF BEARISH ENGULFING CONFLUENCES

SELECT Confluence, COUNT(Confluence) BearEng, SUM(ProfitLossFTP) TotalBearEngProfit
FROM AUDJPY
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence
ORDER BY BearEng DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BEARISH ENGULFING OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bearish Engulfing'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BEARISH ENGULFING OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngTSL
) Total
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngTSL
) Total
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngTSL
) Total
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngTSL
) Total
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngTSL
) Total
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--B&R w/ Bearish Engulfing

--NUMBER OF B&R W/ BEARISH ENGULFING CONFLUENCES

SELECT Confluence, COUNT(Confluence) BnRBearEng
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bearish Engulfing' 
GROUP BY Confluence
ORDER BY BnRBearEng DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R W/ BEARISH ENGULFING OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bearish Engulfing'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R W/ BEARISH ENGULFING OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bearish Engulfing' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBearEngTSL
) Total
WHERE Confluence = 'B&R w/ Bearish Engulfing' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBearEngTSL
) Total
WHERE Confluence = 'B&R w/ Bearish Engulfing' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBearEngTSL
) Total
WHERE Confluence = 'B&R w/ Bearish Engulfing' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBearEngTSL
) Total
WHERE Confluence = 'B&R w/ Bearish Engulfing' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBearEngTSL
) Total
WHERE Confluence = 'B&R w/ Bearish Engulfing' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--B&R w/ Bearish Hammer

--NUMBER OF B&R W/ BEARISH HAMMER CONFLUENCES

SELECT Confluence, COUNT(Confluence) BnRBearHammer
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bearish Hammer' 
GROUP BY Confluence
ORDER BY BnRBearHammer DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R W/ BEARISH HAMMER OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bearish Hammer'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R W/ BEARISH HAMMER OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bearish Hammer' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBearHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBearHamTSL
) Total
WHERE Confluence = 'B&R w/ Bearish Hammer' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBearHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBearHamTSL
) Total
WHERE Confluence = 'B&R w/ Bearish Hammer' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBearHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBearHamTSL
) Total
WHERE Confluence = 'B&R w/ Bearish Hammer' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBearHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBearHamTSL
) Total
WHERE Confluence = 'B&R w/ Bearish Hammer' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBearHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBearHamTSL
) Total
WHERE Confluence = 'B&R w/ Bearish Hammer' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--B&R w/ Bullish Engulfing, Continuation

--NUMBER OF B&R W/ BULLISH ENGULFING, CONTINUATION CONFLUENCES

SELECT Confluence, COUNT(Confluence) BnRBullEngCont
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bullish Engulfing, Continuation' 
GROUP BY Confluence
ORDER BY BnRBullEngCont DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R W/ BULLISH ENGULFING, CONTINUATION OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bullish Engulfing, Continuation'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R W/ BULLISH ENGULFING, CONTINUATION OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bullish Engulfing, Continuation' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBullEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBullEngContTSL
) Total
WHERE Confluence = 'B&R w/ Bullish Engulfing, Continuation'
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBullEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBullEngContTSL
) Total
WHERE Confluence = 'B&R w/ Bullish Engulfing, Continuation'
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBullEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBullEngContTSL
) Total
WHERE Confluence = 'B&R w/ Bullish Engulfing, Continuation'
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBullEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBullEngContTSL
) Total
WHERE Confluence = 'B&R w/ Bullish Engulfing, Continuation'
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBullEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBullEngContTSL
) Total
WHERE Confluence = 'B&R w/ Bullish Engulfing, Continuation'
GROUP BY Confluence;

-----------------------------------------------------------------------

--B&R w/ Bullish Hammer

--NUMBER OF B&R W/ BULLISH HAMMER CONFLUENCES

SELECT Confluence, COUNT(Confluence) BnRBullHammer
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bullish Hammer' 
GROUP BY Confluence
ORDER BY BnRBullHammer DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R W/ BULLISH HAMMER OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bullish Hammer'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R W/ BULLISH HAMMER OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R w/ Bullish Hammer' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBullHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBullHamTSL
) Total
WHERE Confluence = 'B&R w/ Bullish Hammer' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBullHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBullHamTSL
) Total
WHERE Confluence = 'B&R w/ Bullish Hammer' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBullHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBullHamTSL
) Total
WHERE Confluence = 'B&R w/ Bullish Hammer' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBullHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBullHamTSL
) Total
WHERE Confluence = 'B&R w/ Bullish Hammer' 
GROUP BY Confluence

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRBullHamFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRBullHamTSL
) Total
WHERE Confluence = 'B&R w/ Bullish Hammer' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--B&R, Morning Star

--NUMBER OF B&R, MORNING STAR CONFLUENCES

SELECT Confluence, COUNT(Confluence) BnRMornStar
FROM AUDJPY
WHERE Confluence = 'B&R, Morning Star' 
GROUP BY Confluence
ORDER BY BnRMornStar DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R, MORNING STAR OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R, Morning Star'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF B&R, MORNING STAR OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'B&R, Morning Star' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRMorningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRMorningStarTSL
) Total
WHERE Confluence = 'B&R, Morning Star' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRMorningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRMorningStarTSL
) Total
WHERE Confluence = 'B&R, Morning Star' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRMorningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRMorningStarTSL
) Total
WHERE Confluence = 'B&R, Morning Star' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRMorningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRMorningStarTSL
) Total
WHERE Confluence = 'B&R, Morning Star' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,AVG(ProfitLossFTP) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BnRMorningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BnRMorningStarTSL
) Total
WHERE Confluence = 'B&R, Morning Star' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--BEARISH ENGULFING 

--NUMBER OF BEARISH ENGULFING CONFLUENCES

SELECT Confluence, COUNT(Confluence) BearEng
FROM AUDJPY
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence
ORDER BY BearEng DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BEARISH ENGULFING OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bearish Engulfing'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BEARISH ENGULFING OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngTSL
) Total
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngTSL
) Total
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngTSL
) Total
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngTSL
) Total
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngTSL
) Total
WHERE Confluence = 'Bearish Engulfing' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--Bearish Engulfing, Continuation

--NUMBER OF BEARISH ENGULFING, CONTINUATION CONFLUENCES

SELECT Confluence, COUNT(Confluence) BearEngCont
FROM AUDJPY
WHERE Confluence = 'Bearish Engulfing, Continuation' 
GROUP BY Confluence
ORDER BY BearEngCont DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BEARISH ENGULFING, CONTINUATION OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bearish Engulfing, Continuation'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BEARISH ENGULFING, CONTINUATION OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bearish Engulfing, Continuation' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
WHERE Confluence = 'Bearish Engulfing, Continuation' 
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngContTSL
) Total
WHERE Confluence = 'Bearish Engulfing, Continuation' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngContTSL
) Total
WHERE Confluence = 'Bearish Engulfing, Continuation' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngContTSL
) Total
WHERE Confluence = 'Bearish Engulfing, Continuation' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngContTSL
) Total
WHERE Confluence = 'Bearish Engulfing, Continuation' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BearEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BearEngContTSL
) Total
WHERE Confluence = 'Bearish Engulfing, Continuation' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--Bullish Engulfing

--NUMBER OF BULLISH ENGULFING CONFLUENCES

SELECT Confluence, COUNT(Confluence) BullEng
FROM AUDJPY
WHERE Confluence = 'Bullish Engulfing' 
GROUP BY Confluence
ORDER BY BullEng DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BULLISH ENGULFING OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bullish Engulfing'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BULLISH ENGULFING OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bullish Engulfing' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullEngTSL
) Total
WHERE Confluence = 'Bullish Engulfing' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullEngTSL
) Total
WHERE Confluence = 'Bullish Engulfing' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullEngTSL
) Total
WHERE Confluence = 'Bullish Engulfing' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullEngTSL
) Total
WHERE Confluence = 'Bullish Engulfing' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullEngFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullEngTSL
) Total
WHERE Confluence = 'Bullish Engulfing' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--Bullish Engulfing, Continuation

--NUMBER OF BULLISH ENGULFING, CONTINUATION CONFLUENCES

SELECT Confluence, COUNT(Confluence) BullEngCont
FROM AUDJPY
WHERE Confluence = 'Bullish Engulfing, Continuation' 
GROUP BY Confluence
ORDER BY BullEngCont DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BULLISH ENGULFING, CONTINUATION OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bullish Engulfing, Continuation'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF BULLISH ENGULFING, CONTINUATION OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Bullish Engulfing, Continuation' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullEngContTSL
) Total
WHERE Confluence = 'Bullish Engulfing, Continuation' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullEngContTSL
) Total
WHERE Confluence = 'Bullish Engulfing, Continuation' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullEngContTSL
) Total
WHERE Confluence = 'Bullish Engulfing, Continuation' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullEngContTSL
) Total
WHERE Confluence = 'Bullish Engulfing, Continuation' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM BullEngContFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM BullEngContTSL
) Total
WHERE Confluence = 'Bullish Engulfing, Continuation' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--Continuation

--NUMBER OF CONTINUATION CONFLUENCES

SELECT Confluence, COUNT(Confluence) Cont
FROM AUDJPY
WHERE Confluence = 'Continuation' 
GROUP BY Confluence
ORDER BY Cont DESC;

--USE CTE TO FIND PROFIT & NUMBER OF CONTINUATION OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Continuation'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF CONTINUATION OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Continuation' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM ContinuationFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM ContinuationTSL
) Total
WHERE Confluence = 'Continuation' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM ContinuationFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM ContinuationTSL
) Total
WHERE Confluence = 'Continuation' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM ContinuationFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM ContinuationTSL
) Total
WHERE Confluence = 'Continuation' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM ContinuationFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM ContinuationTSL
) Total
WHERE Confluence = 'Continuation' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM ContinuationFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM ContinuationTSL
) Total
WHERE Confluence = 'Continuation' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--Evening Star

--NUMBER OF EVENING STAR CONFLUENCES

SELECT Confluence, COUNT(Confluence) EveningStar
FROM AUDJPY
WHERE Confluence = 'Evening Star' 
GROUP BY Confluence
ORDER BY EveningStar DESC;

--USE CTE TO FIND PROFIT & NUMBER OF EVENING STAR OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Evening Star'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF EVENING STAR OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Evening Star' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM EveningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM EveningStarTSL
) Total
WHERE Confluence = 'Evening Star' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM EveningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM EveningStarTSL
) Total
WHERE Confluence = 'Evening Star' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM EveningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM EveningStarTSL
) Total
WHERE Confluence = 'Evening Star' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM EveningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM EveningStarTSL
) Total
WHERE Confluence = 'Evening Star' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM EveningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM EveningStarTSL
) Total
WHERE Confluence = 'Evening Star' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--Morning Star

--NUMBER OF MORNING STAR CONFLUENCES

SELECT Confluence, COUNT(Confluence) MorningStar
FROM AUDJPY
WHERE Confluence = 'Morning Star' 
GROUP BY Confluence
ORDER BY MorningStar DESC;

--USE CTE TO FIND PROFIT & NUMBER OF MORNING STAR OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Morning Star'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF MORNING STAR OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Morning Star' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM MorningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM MorningStarTSL
) Total
WHERE Confluence = 'Morning Star' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM MorningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM MorningStarTSL
) Total
WHERE Confluence = 'Morning Star' 
GROUP BY Confluence;

--SMALLEST PROFIT 

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM MorningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM MorningStarTSL
) Total
WHERE Confluence = 'Morning Star' 
GROUP BY Confluence;

--LARGEST PROFIT

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM MorningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM MorningStarTSL
) Total
WHERE Confluence = 'Morning Star' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM MorningStarFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM MorningStarTSL
) Total
WHERE Confluence = 'Morning Star' 
GROUP BY Confluence;

-----------------------------------------------------------------------

--Trending

--NUMBER OF TRENDING CONFLUENCES

SELECT Confluence, COUNT(Confluence) Trending
FROM AUDJPY
WHERE Confluence = 'Trending' 
GROUP BY Confluence
ORDER BY Trending DESC;

--USE CTE TO FIND PROFIT & NUMBER OF TRENDING OCCURENCES FTP

WITH FTP AS 
(SELECT Confluence,ProfitLossFTP,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Trending'
GROUP BY Confluence, ProfitLossFTP
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM FTP
ORDER BY OutcomeFrequency DESC;

--USE CTE TO FIND PROFIT & NUMBER OF TRENDING OCCURENCES TSL

WITH TSL AS 
(SELECT Confluence,ProfitLossTSL,COUNT(Confluence) OutcomeFrequency
FROM AUDJPY
WHERE Confluence = 'Trending' 
GROUP BY Confluence, ProfitLossTSL
--ORDER BY OutcomeFrequency DESC
)
SELECT *
FROM TSL
ORDER BY OutcomeFrequency DESC;

--PROFIT BEFORE SPLIT

SELECT Confluence,SUM(ProfitLossFTP) TotalProfitBeforeSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM TrendingFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM TrendingTSL
) Total
WHERE Confluence = 'Trending' 
GROUP BY Confluence;

--PROFIT AFTER 70% SPLIT

SELECT Confluence,SUM(ProfitLossFTP) * 0.7 TotalProfitAfterSplit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM TrendingFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM TrendingTSL
) Total
WHERE Confluence = 'Trending' 
GROUP BY Confluence;

--SMALLEST PROFIT

SELECT Confluence,MIN(ProfitLossFTP) SmallestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM TrendingFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM TrendingTSL
) Total
WHERE Confluence = 'Trending' 
GROUP BY Confluence;

--LARGEST PROFIT 

SELECT Confluence,MAX(ProfitLossFTP) LargestProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM TrendingFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM TrendingTSL
) Total
WHERE Confluence = 'Trending' 
GROUP BY Confluence;

--AVERAGE PROFIT

SELECT Confluence,ROUND(AVG(ProfitLossFTP),2) AverageProfit
FROM
(
    SELECT Confluence,ProfitLossFTP
    FROM TrendingFTP
    UNION ALL
    SELECT Confluence,ProfitLossTSL
    FROM TrendingTSL
) Total
WHERE Confluence = 'Trending' 
GROUP BY Confluence;

-----------------------------------------------------------------------
