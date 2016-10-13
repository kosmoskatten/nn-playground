module Network
    ( Network (..)
    , mkLiteralNetwork
    , feedForward
    , totalErr
    ) where

import qualified Data.Vector as V

import Layer

data Network = Network
    { hidden :: !Layer
    , output :: !Layer
    } deriving Show

mkLiteralNetwork :: Layer -> Layer -> Network
mkLiteralNetwork = Network

feedForward :: Network -> NNVector -> NNVector
feedForward network = feed (output network) . feed (hidden network)

totalErr :: [Float] -> NNVector -> Float
totalErr targets = V.sum . V.zipWith err (V.fromList targets)

err :: Float -> Float -> Float
err target out = 0.5 * (target - out) ^ (2 :: Int)
