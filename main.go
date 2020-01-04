package main

import (
  "fmt"
  "log"
  "os"
  "os/exec"
  "github.com/urfave/cli/v2"
)

func cmdRun(command string) {
  cmd := exec.Command(command)
  out, err := cmd.CombinedOutput()
  if err != nil {
      log.Fatalf("%s\n", err)
  }
  fmt.Printf("%s\n", string(out))
}

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
      } else if os.Getenv("AWS_ACCESS_KEY_ID") == "" || os.Getenv("AWS_SECRET_ACCESS_KEY") == "" || os.Getenv("AWS_REGION") == "" {
        log.Fatal("All AWS environment variables is mandatory")
      } else {
        cmdRun(`find ` + c.Args().Get(0) + ` -regex ".*\.\(css\|htm\|html\|js\|json\|svg\|xml\)" -exec minify "{}" -o "{}" \;`)
        cmdRun(`find ` + c.Args().Get(0) + ` -regex ".*\.\(png\)" -exec pngquant -f --ext=.png --quality=85-95 "{}" \;`)
        cmdRun(`find ` + c.Args().Get(0) + ` -regex ".*\.\(jpg\|jpeg\)" -exec jpegoptim -f --max=95 --size=0.95 -o "{}" \;`)
        cmdRun(`find ` + c.Args().Get(0) + ` -regex ".*\.\(gif\)" -exec gifsicle --lossy=100 "{}" -o "{}" \;`)
      }
      return nil
    },
  }
  err := app.Run(os.Args)
  if err != nil {
    log.Fatal(err)
  }
}