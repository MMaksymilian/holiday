/*
 * Copyright 2002-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package flex.common.data {

    [RemoteClass(alias="test.primaris.entity.dto.HolidayDTO")]
    public class Holiday {

        public var id:Number;
        public var cause:String;
        public var status:String;
        public var dateFrom:Date;
        public var dateTo:Date;

        public function Holiday() {
            super();
        }
    }
}