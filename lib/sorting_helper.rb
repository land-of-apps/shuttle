# Copyright 2016 Square Inc.
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

module SortingHelper
  def self.order_by_elasticsearch_result_order(objects, objects_in_es)
    ordered_ids = objects_in_es.map(&:id).map(&:to_i)
    hash = objects.index_by(&:id)
    ordered_objects = []
    ordered_ids.each { |id| ordered_objects << hash[id] if hash[id] }
    ordered_objects
  end
end
