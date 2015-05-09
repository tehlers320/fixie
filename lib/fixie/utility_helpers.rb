# -*- indent-tabs-mode: nil; fill-column: 110 -*-
#
# Copyright (c) 2015 Chef Software Inc.
# License :: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Author: Mark Anderson <mark@chef.io>
#
require 'sequel'

require 'fixie/config.rb'
require 'fixie/authz_objects.rb'
require 'fixie/authz_mapper.rb'

require 'pp'

module Fixie
  module UtilityHelpers
    def self.orgs
      @orgs ||= Fixie::Sql::Orgs.new
    end
    def self.users
      @users ||= Fixie::Sql::Users.new
    end
    def self.assocs
      @assocs ||= Fixie::Sql::Associations.new
    end
    def self.invites
      invites ||= Fixie::Sql::Invites.new
    end

    def self.make_user(user)
      if user.is_a?(String)
        return users[user]
      elsif user.is_a?(Fixie::Sql::User)
        return user
      else
        raise Exception "Expected a user, got a #{user.class}"
      end
    end      
    def self.make_org(org)
      if org.is_a?(String)
        return orgs[org]
      elsif org.is_a?(Fixie::Sql::Org)
        return org
      else
        raise Exception "Expected an org, got a #{org.class}"
      end
    end      
  end
end
