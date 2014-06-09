import Control.Concurrent
import Control.Monad
import Data.Time.Clock
import System.Cron

main :: IO ()
main = do
 putStrLn $ show schedule
 putStrLn $ show schedule'
 forever $ do
  now <- getCurrentTime
  when (scheduleMatches schedule''' now) doWork
  putStrLn "sleeping"
  threadDelay 10000000
 where
  doWork = putStrLn "work"
  schedule = hourly
  schedule' = everyMinute
  schedule'' = everySecond
  schedule''' = CronSchedule {
   second     = Seconds Star,
   minute     = Minutes $ SpecificField 44,
   hour       = Hours Star,
   dayOfMonth = DaysOfMonth Star,
   month      = Months Star,
   dayOfWeek  = DaysOfWeek Star
  }
