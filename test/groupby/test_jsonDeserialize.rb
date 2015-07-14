require 'require_all'
require_all 'lib/groupby/model'
require 'minitest/autorun'

module Groupby
  class TestJsonDeserialize < Minitest::Test

    JSON_RICH_CONTENT_ZONE = '{"content":"crestfallen","_id":"f90j1e1rf","name":"appalled","type":"Rich_Content"}'
    JSON_CONTENT_ZONE = '{"content":"mushy","_id":"23425n89hr","name":"porcelain","type":"Content"}'
    JSON_BANNER_ZONE = '{"content":"man","_id":"asf0j2380jf","name":"vitruvian","type":"Banner"}'
    JSON_CLUSTER_RECORD = '{"title":"fubar","url":"example.com","snippet":"itty bit"}'
    JSON_REFINEMENT_MATCH_VALUE = '{"value":"adverb","count":43}'
    JSON_METADATA = '{"key":"orange","value":"apple"}'
    JSON_REFINEMENT_VALUE = '{"_id":"fadfs89y10j","count":987,"type":"Value","value":"malaise","exclude":false}'
    JSON_REFINEMENT_RANGE = '{"high":"delicious","low":"atrocious","_id":"342h9582hh4","count":14,"type":"Range","exclude":true}'
    JSON_PAGE_INFO = '{"recordStart":20,"recordEnd":50}'
    JSON_RESTRICT_NAVIGATION = '{"name":"categories","count":2}'
    JSON_CUSTOM_URL_PARAM = '{"key":"guava","value":"mango"}'
    JSON_SORT = '{"field":"price","order":"Descending"}'
    JSON_REFINEMENT_MATCH = '{"name":"grapheme","values":[' + JSON_REFINEMENT_MATCH_VALUE + ']}'
    JSON_RECORD = '{"_id":"fw90314jh289t","_u":"exemplar.com","_snippet":"Curator","_t":"Periwinkle",' +
        '"allMeta":{"look":"at","all":"my","keys":["we","are","the","values"]},"refinementMatches":[' +
        JSON_REFINEMENT_MATCH + ']}'
    JSON_RECORD_ZONE = '{"records":[' + JSON_RECORD + '],"_id":"1240jfw9s8","name":"gorbachev","type":"Record"}'
    JSOM_TEMPLATE = '{"_id":"fad87g114","name":"bulbous","ruleName":"carmageddon",' +
        '"zones":[' + JSON_CONTENT_ZONE + ',' + JSON_RECORD_ZONE + ']}'
    JSON_CLUSTER = '{"records":[' + JSON_CLUSTER_RECORD + '],"term":"some"}'
    JSON_NAVIGATION = '{"_id":"081h29n81f","name":"green","displayName":"GReeN","range":true,"or":false,' +
        '"type":"Range_Date","sort":' + JSON_SORT + ',"refinements":['+ JSON_REFINEMENT_RANGE + ',' +
        JSON_REFINEMENT_VALUE + '],"metadata":[' + JSON_METADATA + '],"moreRefinements":true}'
    JSON_PARTIAL_MATCH_RULE = '{"terms":2,"termsGreaterThan":45,"mustMatch":4,"percentage":true}'
    JSON_MATCH_STRATEGY = '{"rules":[' + JSON_PARTIAL_MATCH_RULE + ']}'
    JSON_REQUEST = '{"clientKey":"adf7h8er7h2r","collection":"ducks","area":"surface","skip":12,"pageSize":30,' +
        '"biasingProfile":"ballooning","language":"en","pruneRefinements":true,"returnBinary":false,"query":"cantaloupe",' +
        '"sort":[' + JSON_SORT + '],"fields":["pineapple","grape","clementine"],"orFields":["pumpernickel","rye"],' +
        '"refinements":[' + JSON_REFINEMENT_RANGE + ',' + JSON_REFINEMENT_VALUE + '],"customUrlParams":[' +
        JSON_CUSTOM_URL_PARAM + '],"restrictNavigation":' + JSON_RESTRICT_NAVIGATION + ',"refinementQuery":"cranberry",' +
        '"wildcardSearchEnabled":true,"matchStrategy":' + JSON_MATCH_STRATEGY + '}'

  end
end