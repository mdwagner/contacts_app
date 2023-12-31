# This file loads your app and all your tasks when running 'lucky'
#
# Run 'lucky --help' to see all available tasks.
#
# Learn to create your own tasks:
# https://luckyframework.org/guides/command-line-tasks/custom-tasks

# See `LuckyEnv#task?`
ENV["LUCKY_TASK"] = "true"

# Load Lucky and the app (actions, models, etc.)
require "./src/app"
require "lucky_task"

# Log migrations
Log.setup "mg", :debug

# You can add your own tasks here in the ./tasks folder
require "./tasks/**"

# Load Lucky tasks (dev, routes, etc.)
require "lucky/tasks/**"

LuckyTask::Runner.run
