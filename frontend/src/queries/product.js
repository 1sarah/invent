import { gql } from '@apollo/client';

export const GET_PRODUCTS = gql`
query{
  getAllProducts(filter: {offset: 0,limit: 30}){
    total
    product{
        price
        name
        sku
        id
      }
    }
  
}
`;

export const ADD_PRODUCT = gql`
  mutation($name: String!, $price: Float!, $quantity: Int!) {
    addProduct(name: $name, price: $price, quantity: $quantity) {
      id
      name
      price
      quantity
    }
  }
`;

export const GET_PRODUCTS_BY_MONTH = gql`
 query{
   getProductByMonth{
       month
       count
     }
    }
 `;

const UPDATE_PRODUCT = gql`
  mutation UpdateProduct(
    $id: ID!
    $name: String
    $description: String
    $price: Float
    $stockLevel: Int
  ) {
    updateProduct(
      id: $id
      name: $name
      description: $description
      price: $price
      stockLevel: $stockLevel
    ) {
      id
      name
      description
      price
      stockLevel
    }
  }
`;
