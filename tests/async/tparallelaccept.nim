import asyncdispatch, asyncnet

proc cb(client: AsyncSocket, address: string): Future[void] {.async.} =
  echo("cb called")
  #let line = await client.recvLine()
  #echo(line)
  client.close()


let server = newAsyncSocket()
server.setSockOpt(OptReuseAddr, true)
server.bindAddr(Port(1024))
server.listen()

server.parallelAccept(cb)