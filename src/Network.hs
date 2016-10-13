module Network
    ( Network (..)
    , mkLiteralNetwork
    , feedForward
    ) where

import Layer

data Network = Network
    { hidden :: !Layer
    , output :: !Layer
    } deriving Show

mkLiteralNetwork :: Layer -> Layer -> Network
mkLiteralNetwork = Network

feedForward :: Network -> NNVector -> NNVector
feedForward network = feed (output network) . feed (hidden network)
