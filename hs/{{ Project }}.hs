module {{ Project }} where

hello_world :: IO ()
hello_world = putStrLn "Hello from Haskell!"

foreign export ccall read_dhall :: IO ()
