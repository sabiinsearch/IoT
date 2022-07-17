#!/usr/bin/env python
# Copyright (c) 2020 Project CHIP Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Copyright 2015 The Chromium Authors. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#    * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#    * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# This writes headers for build defines. See buildconfig_header.gni for
# usage of this system as a whole.
#
# The parameters are passed in a response file so we don't have to worry
# about command line lengths. The name of the response file is passed on the
# command line.
#
# The format of the response file is:
#    [--defines <list of one or more defines values>]

import optparse
import os
import shlex


class Options:
    def __init__(self, output, rulename, header_guard, defines):
        self.output = output
        self.rulename = rulename
        self.header_guard = header_guard
        self.defines = defines


def GetOptions():
    parser = optparse.OptionParser()
    parser.add_option('--output', help="Output header name inside --gen-dir.")
    parser.add_option('--rulename',
                      help="Helpful name of build rule for including in the " +
                           "comment at the top of the file.")
    parser.add_option('--gen-dir',
                      help="Path to root of generated file directory tree.")
    parser.add_option('--definitions',
                      help="Name of the response file containing the defines.")
    cmdline_options, cmdline_flags = parser.parse_args()

    # Compute header guard by replacing some chars with _ and upper-casing.
    header_guard = cmdline_options.output.upper()
    header_guard = \
        header_guard.replace('/', '_').replace('\\', '_').replace('.', '_')
    header_guard += '_'

    # The actual output file is inside the gen dir.
    output = os.path.join(cmdline_options.gen_dir, cmdline_options.output)

    # Definition file in GYP is newline separated, in GN they are shell formatted.
    # shlex can parse both of these.
    with open(cmdline_options.definitions, 'r') as def_file:
        defs = shlex.split(def_file.read())
    defines_index = defs.index('--defines')

    # Everything after --defines are defines. true/false are remapped to 1/0,
    # everything else is passed through.
    defines = []
    for define in defs[defines_index + 1:]:
        equals_index = define.index('=')
        key = define[:equals_index]
        value = define[equals_index + 1:]

        # Canonicalize and validate the value.
        if value == 'true':
            value = '1'
        elif value == 'false':
            value = '0'
        defines.append((key, str(value)))

    return Options(output=output,
                   rulename=cmdline_options.rulename,
                   header_guard=header_guard,
                   defines=defines)


def WriteHeader(options):
    with open(options.output, 'w') as output_file:
        output_file.write("// Generated by write_buildconfig_header.py\n")
        if options.rulename:
            output_file.write('// From "' + options.rulename + '"\n')

        output_file.write('\n#ifndef %s\n' % options.header_guard)
        output_file.write('#define %s\n\n' % options.header_guard)

        for pair in options.defines:
            output_file.write('#define %s %s\n' % pair)

        output_file.write('\n#endif  // %s\n' % options.header_guard)


options = GetOptions()
WriteHeader(options)
