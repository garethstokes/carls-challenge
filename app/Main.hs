{- Carls challenge
 - -------------------------
 -
 - A simple example of using the state monad combined with 
 - taking input from io
 -
 - ask the user for an integer input, when received then 
 - increment the counter in memory, display the value
 - and then ask the user for more input.
 -
 -}

module Main where

import Control.Monad.State

type App = StateT Integer IO

askForNumber :: App ()
askForNumber = do
  -- read input from IO
  i <- liftIO readLn :: App Integer

  -- get the state from the monad
  counter <- get

  -- increment
  let value = counter + i

  -- display to the user
  liftIO $ putStrLn (show value)

  -- override the state with the new value
  put value

  -- goto 20
  askForNumber

main :: IO ((), Integer)
main = runStateT askForNumber 0
