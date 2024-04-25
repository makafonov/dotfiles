// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: {
    name: "Microsoft Edge",
    profile: "Default",
  },
  handlers: [
    {
      match: [
        "meet.google.com/*",
      ],
      browser: {
        name: "Microsoft Edge",
        profile: "Profile 1",
      }
    },
    {
      match: [
        "github.com/*",
      ],
      browser: {
        name: "Safari",
      }
    }
  ]
}
