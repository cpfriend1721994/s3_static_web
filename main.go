package main

import (
  "fmt"
  "log"
  "os"
  "github.com/urfave/cli"
)

func main() {
  app := &cli.App{
    Name: "s3static",
    Usage: "Push static web pages to s3, with compress images and minify HTML/JS/CSS",
    Action: func(c *cli.Context) error {
      fmt.Println("Hello friend!")
      return nil
    },
  }

  err := app.Run(os.Args)
  if err != nil {
    log.Fatal(err)
  }
}