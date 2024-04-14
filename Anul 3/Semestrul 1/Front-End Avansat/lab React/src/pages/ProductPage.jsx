import { useEffect } from "react";
import { useParams } from "react-router-dom";

const ProductPage = () => {
  const params = useParams();

  console.log(params);
  useEffect(() => {
    console.log("fetch product " + params.id);
  }, [params.id]);

  return <div>Product id: {params.id}</div>;
};

export default ProductPage;
