# Copyright 2014 Square Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

namespace :maintenance do
  desc "Cleans old commits from Shuttle"
  task clean_old_commits: :environment do
    Project.all.each do |p|
      p.commits.where(ready: true, loading: false).order('created_at DESC').offset(250).each do |c|
        StashWebhookHelper.new.ping(c, true)
        c.destroy
      end
    end
  end
end
