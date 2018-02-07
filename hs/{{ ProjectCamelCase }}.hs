{-# LANGUAGE ForeignFunctionInterface #-}

module {{ ProjectCamelCase }} where

hello_world :: IO ()
hello_world = putStrLn "Hello from Haskell!"

foreign export ccall hello_world :: IO ()
