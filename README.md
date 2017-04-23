# dinosaur-example-project
Minimal example project for [Dinosaur](https://github.com/rwhaling/dinosaur), a CGI-based Scala Native web framework.  See the main repo for more documentation.

## usage

```sh
docker build . -t dinosaur-example
docker run -d -p 8080:8080 dinosaur-example
<Navigate to your docker host at port 8080>
```

## example code

```scala
package io.dinosaur.main
import io.dinosaur._

object main {
  def main(args: Array[String]): Unit = {
    Router.init()
          .get("/")("<H1>Welcome to Dinosaur!</H1>")
          .get("/hello") { request =>
            "Hello World!"
          }
          .get("/who")( request =>
            request.pathInfo match {
              case Seq("who") => "Who's there?"
              case Seq("who",x) => "Hello, " + x
              case Seq("who",x,y) => "Hello both of you"
              case _ => "Hello y'all!"
            }
          )
          .get("/bye")( request =>
            request.params.getOrElse("who",Seq.empty)
                   .map { x => "Bye, " + x }
                   .mkString(". ")
          )
          .dispatch()
  }
}
```
