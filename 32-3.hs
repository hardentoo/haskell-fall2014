downUp :: Int -> IO()

downUp 1 = print 1
downUp n = do
  print n
  downUp (n - 1)
  print n
