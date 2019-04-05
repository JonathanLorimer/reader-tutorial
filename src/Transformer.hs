{-# LANGUAGE FlexibleContexts #-}

module Transformer
    ( printURI
    , printQuiet
    ) where

import Config
import Control.Monad.Reader

type App = ReaderT Context IO

printURI :: App ()
printURI = do
    ctx <- ask
    liftIO $ ctxPrint ctx $ "The URI given to App is " <> uri (ctxConfig ctx)

printQuiet :: App ()
printQuiet = do
    ctx <- ask
    liftIO $ print $ "The QUIET switch given to App is " <> show (quiet $ ctxConfig ctx)
