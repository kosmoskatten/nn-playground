module Main where

import Layer

main :: IO ()
main = do
  let layer = mkLiteralLayer (fromList [ fromList [0.15, 0.2]
                                       , fromList [0.25, 0.30]
                                       ]) 
                             (fromList [0.35, 0.35])
  print $ feed layer (fromList [ 0.05, 0.1 ])
