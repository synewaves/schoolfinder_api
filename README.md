# SchoolfinderApi

SchoolfinderApi is a ruby library to access the [Education.com SchoolFinder API](http://www.education.com/schoolfinder/tools/webservice/).

Supports the following API methods, with real ruby classes returned for each call.

* [schoolSearch](http://www.education.com/webservice/documentation/?section=schoolsearch)

# Installing

TODO: once this is an official gem

# Examples

Adding setup into an initializer:

    SchoolfinderApi.configure do |configuration|
      configuration.key = "12341221sdaf"
    end

Getting school search results:

    schools = SchoolfinderApi::Functions.school_search({ :city => 'Baton Rouge', :state => 'LA' })
    if schools.success?
      schools.each do |school|
        puts school.id
      end
    end

# Documentation

TODO: once this is an official gem

# More Information

TODO: once this is an official gem

# License

SchoolfinderApi uses the MIT license. See LICENSE for more details.