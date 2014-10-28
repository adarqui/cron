{-# LANGUAGE OverloadedStrings #-}

import Control.Concurrent
import Control.Monad
import Data.Time.Clock
import Data.Attoparsec.Text
import System.Environment
import System.Cron
import System.Cron.Parser

import qualified Data.Text as T

main :: IO ()
main = do
 argv <- getArgs
 case argv of
  (pause:schedule:[]) -> do
   case (parseOnly cronScheduleLooseGranular $ T.pack schedule) of
    (Left err) -> error $ "Invalid cron syntax: " ++ err
    (Right cron') -> do
     putStrLn $ show cron'
     ping (read pause :: Int) cron'
  otherwise -> error "usage: ./ping <pause-in-microseconds> 'seconds minutes hours days months years'"

ping :: Int -> CronSchedule -> IO ()
ping pause cron = do
 forever $ do
  now <- getCurrentTime
  putStrLn $ show now
  threadDelay pause
  when (scheduleMatches cron now) $ putStrLn "ping"
