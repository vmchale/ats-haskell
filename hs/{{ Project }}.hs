{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE DeriveGeneric            #-}
{-# LANGUAGE DeriveAnyClass           #-}
{-# LANGUAGE IncoherentInstnances     #-}

module {{ Project }} where

hello_world :: IO ()
hello_world = putStrLn "Hello from Haskell!"

foreign export ccall hello_world :: IO ()
