module Layer 
    ( NNVector
    , Layer
    , mkLiteralLayer
    , feed
    , fromList
    ) where

import Data.Vector

import qualified Data.Vector as V

type NNVector = Vector Float

data Layer = Layer
    { weights :: !(Vector NNVector)
    , biases  :: !NNVector
    } deriving Show

mkLiteralLayer :: Vector NNVector -> NNVector -> Layer
mkLiteralLayer = Layer

feed :: Layer -> NNVector -> NNVector
feed layer input = imap onNeutron $ biases layer
    where
        onNeutron :: Int -> Float -> Float
        onNeutron index bias =
            let w   = weights layer ! index
                net = input <.> w + bias
            in sigma net

sigma :: Float -> Float
sigma z = 1 / (1 + exp (-z))

(<.>) :: NNVector -> NNVector -> Float
(<.>) a = V.sum . V.zipWith (*) a
