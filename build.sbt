name := "dinosaur-project"
version := "0.1.0"
organization := "io.whaling"
licenses += ("WTFPL", url("http://www.wtfpl.net/txt/copying/"))
enablePlugins(ScalaNativePlugin)

scalaVersion := "2.11.8"
scalacOptions ++= Seq("-feature")

resolvers += Resolver.bintrayRepo("rwhaling","maven")
libraryDependencies += "io.whaling" %% "dinosaur_native0.1" % "0.1.0"

// nativeLinkingOptions += "-static -lrt -lunwind -lunwind-x86_64 -lgc"
