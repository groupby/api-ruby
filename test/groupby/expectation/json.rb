module Groupby
  module Json

    RICH_CONTENT_ZONE = '{"type":"Rich_Content","_id":"f90j1e1rf","name":"appalled","content":"crestfallen"}'
    CONTENT_ZONE = '{"type":"Content","_id":"23425n89hr","name":"porcelain","content":"mushy"}'
    BANNER_ZONE = '{"type":"Banner","_id":"asf0j2380jf","name":"vitruvian","content":"man"}'
    CLUSTER_RECORD = '{"title":"fubar","url":"example.com","snippet":"itty bit"}'
    REFINEMENT_MATCH_VALUE = '{"value":"adverb","count":43}'
    METADATA = '{"key":"orange","value":"apple"}'
    REFINEMENT_VALUE = '{"type":"Value","_id":"fadfs89y10j","count":987,"value":"malaise","exclude":false}'
    REFINEMENT_RANGE = '{"type":"Range","_id":"342h9582hh4","count":14,"high":"delicious","low":"atrocious","exclude":true}'
    PAGE_INFO = '{"recordStart":20,"recordEnd":50}'
    RESTRICT_NAVIGATION = '{"count":2,"name":"categories"}'
    CUSTOM_URL_PARAM = '{"key":"guava","value":"mango"}'
    SORT = '{"field":"price","order":"Descending"}'
    REFINEMENT_MATCH = '{"name":"grapheme","values":[' + REFINEMENT_MATCH_VALUE + ']}'
    RECORD = '{"_id":"fw90314jh289t","_t":"Periwinkle","_snippet":"Curator","_u":"exemplar.com",' +
        '"allMeta":{"look":"at","all":"my","keys":["we","are","the","values"]},"refinementMatches":[' +
        REFINEMENT_MATCH + ']}'
    RECORD_ZONE = '{"type":"Record","_id":"1240jfw9s8","name":"gorbachev","records":[' + RECORD + ']}'
    TEMPLATE = '{"_id":"fad87g114","name":"bulbous","ruleName":"carmageddon",' +
        '"zones":[' + CONTENT_ZONE + ',' + RECORD_ZONE + ']}'
    CLUSTER = '{"records":[' + CLUSTER_RECORD + '],"term":"some"}'
    NAVIGATION = '{"_id":"081h29n81f","name":"green","displayName":"GReeN","or":false,"type":"Range_Date",' +
        '"range":true,"sort":' + SORT + ',"metadata":[' + METADATA + '],"refinements":[' +
        REFINEMENT_RANGE + ',' + REFINEMENT_VALUE + '],"moreRefinements":true}'
    PARTIAL_MATCH_RULE = '{"mustMatch":4,"terms":2,"termsGreaterThan":45,"percentage":true}'
    MATCH_STRATEGY = '{"rules":[' + PARTIAL_MATCH_RULE + ']}'
    REQUEST = '{"clientKey":"adf7h8er7h2r","collection":"ducks","area":"surface","skip":12,"pageSize":30,' +
        '"biasingProfile":"ballooning","language":"en","pruneRefinements":true,"returnBinary":false,"query":"cantaloupe",' +
        '"refinementQuery":"cranberry","sort":[' + SORT + '],"fields":["pineapple","grape","clementine"],' +
        '"orFields":["pumpernickel","rye"],"refinements":[' + REFINEMENT_RANGE + ',' + REFINEMENT_VALUE + '],' +
        '"customUrlParams":[' + CUSTOM_URL_PARAM + '],"wildcardSearchEnabled":true,"restrictNavigation":' +
        RESTRICT_NAVIGATION + ',"matchStrategy":' + MATCH_STRATEGY + '}'
    REFINEMENTS_REQUEST = '{"originalQuery":' + REQUEST + ',"navigationName":"height"}'
    RESULTS = '{"availableNavigation":[' + NAVIGATION + '],"selectedNavigation":[' + NAVIGATION + '],"clusters":[' +
        CLUSTER + '],"records":[' + RECORD + '],"didYouMean":["square","skewer"],"relatedQueries":["squawk","ask"],' +
        '"siteParams":[' + METADATA + '],"rewrites":["Synonym","Antonym","Homonym"],"pageInfo":' + PAGE_INFO +
        ',"template":' + TEMPLATE + ',"redirect":"/to/the/moon.html","errors":"criminey!","query":"skwuare",' +
        '"area":"christmas","totalRecordCount":34}'
    REFINEMENT_RESULTS = '{"errors":"Could not load","navigation":' + NAVIGATION + '}'

  end
end