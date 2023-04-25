import { gql } from '@apollo/client';

export const GET_PRODUCTS = gql`
 query {
   getAllProducts (filter: {limit: 2}){
  # totalCount
   edges{
    node{
      name
      id
      price
    }
    cursor
  }
  pageInfo{
    hasNextPage
    endCursor
    startCursor
    hasPreviousPage
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
