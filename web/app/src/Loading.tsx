import * as React from 'react';


const Loading = (props) => {

  return (
    <div className="loading"><img src={process.env.PUBLIC_URL + "/loading.gif" } /></div>
  );
};

export default Loading;
