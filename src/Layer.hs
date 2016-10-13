module Layer
    ( NNVector
    , Layer
    , mkLiteralLayer
    , feed
    ) where

import Data.Vector (Vector)

import qualified Data.Vector as V

type NNVector = Vector Float

data Layer = Layer
    { weights :: !(Vector NNVector)
    , biases  :: !NNVector
    } deriving Show

mkLiteralLayer :: [[Float]] -> [Float] -> Layer
mkLiteralLayer ws bs = Layer (V.fromList $ map V.fromList ws) $ V.fromList bs

feed :: Layer -> NNVector -> NNVector
feed layer input = V.imap onNeutron $ biases layer
    where
        onNeutron :: Int -> Float -> Float
        onNeutron index bias =
            let w   = weights layer V.! index
                net = input <.> w + bias
            in sigma net

sigma :: Float -> Float
sigma z = 1 / (1 + exp (-z))

(<.>) :: NNVector -> NNVector -> Float
(<.>) a = V.sum . V.zipWith (*) a
