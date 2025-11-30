// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

export default {
  defaultBrowser: {
    name: "Arc",
    profile: "makafonov",
  },
  rewrite: [
    {
      match: finicky.matchHostnames(["mm.tochka.com"]),
      url: (url) => url.href
        .replace("https://", "connect-link://")
        .replace("mm.", "connect.")
        .replace("/tochka/", "/")

    },
    {
      match: finicky.matchHostnames(["connect.tochka.com"]),
      url: (url) => url.href.replace("https://", "connect-link://")
    }
  ],
  handlers: [
    {
      match: [
        "meet.google.com/*",
      ],
      browser: {
        name: "Arc",
        profile: "dr.safiullin",
      }
    },
    {
      match: [
        "*.ktalk.ru*",
      ],
      browser: {
        name: "Google Chrome",
      }
    }
  ]
}
