package main

import (
  "log"
  "os"
  "os/exec"
  "github.com/urfave/cli/v2"
)

func main() {
  app := &cli.App{
    Name: "s3static",
    Usage: "AWS_ACCESS_KEY_ID=<your key> AWS_SECRET_ACCESS_KEY=<your secret> AWS_REGION=<your region>  s3static <directory path> <s3 destination path>",
    UsageText: "s3static - push static web pages to s3, with compress images and minify HTML/JS/CSS",
    Version: "1.0.0",
    Authors: []*cli.Author{
      &cli.Author{
        Name:  "Nguyễn Nhật Minh Tú",
        Email: "hedspi1721994@gmail.com",
      },
    },
    HelpName: "tunnm",
    Action: func(c *cli.Context) error {
      if c.Args().Get(2) != "" || c.Args().Get(0) == "" || c.Args().Get(1) == "" {
        log.Fatal("Wrong numbers of arguments, must be 2")
        return nil
      }
      if os.Getenv("AWS_ACCESS_KEY_ID") == "" || os.Getenv("AWS_SECRET_ACCESS_KEY") == "" || os.Getenv("AWS_REGION") == "" {
        log.Fatal("All AWS environment variables is mandatory")
        return nil
      }
      cmd := exec.Command("ls", "-lah")
      cmd.Stdout = os.Stdout
      cmd.Stderr = os.Stderr
      err := cmd.Run()
      if err != nil {
        log.Fatalf("%s\n", err)
      }
      return nil
    },
  }

  err := app.Run(os.Args)
  if err != nil {
    log.Fatal(err)
  }
}