package main

import (
  "fmt"
  "log"
  "os"
  "github.com/urfave/cli/v2"
)

func main() {
  app := &cli.App{
    Name: "s3static",
    Usage: "Push static web pages to s3, with compress images and minify HTML/JS/CSS",
    Flags: []cli.Flag{
      &cli.StringFlag{
        Name:    "lang",
        Aliases: []string{"l"},
        Value:   "english",
        Usage:   "language for the greeting",
        EnvVars: []string{"LEGACY_COMPAT_LANG", "APP_LANG", "LANG"},
      },
    },
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